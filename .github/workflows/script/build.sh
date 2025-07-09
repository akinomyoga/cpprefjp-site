#!/bin/bash

# site_generator 直下でこのスクリプトを実行すること

set -ex

# dist を生成
pushd kunai
  npm install
  npm run build
popd

# dist の中身を cpprefjp の static ディレクトリに反映
pushd cpprefjp/static/static
  ln -s ../../../kunai/dist kunai
popd

# crsearch.json ファイルを生成
pushd crsearch.json
  ln -s ../cpprefjp/site site
  pip3 install -r docker/requirements.txt
  python3 run.py
popd

# crsearch.json を cpprefjp の static ディレクトリに反映
mkdir -p cpprefjp/static/static/crsearch
pushd cpprefjp/static/static/crsearch
  ln -s ../../../../crsearch.json/crsearch.json crsearch.json
  ln -s ../../../../crsearch.json/crsearch.js crsearch.js
popd

# サイトの生成
pip3 install -r docker/requirements.txt
python3 run.py settings.cpprefjp --concurrency=`nproc`

if (($# == 0)); then
  # 生成されたサイトの中身を push
  pushd cpprefjp/cpprefjp.github.io
    # push するために ssh のリモートを追加する
    git remote add origin2 git@github.com:cpprefjp/cpprefjp.github.io.git

    git add ./ --all
    git config --global user.email "shigemasa7watanabe+cpprefjp@gmail.com"
    git config --global user.name "cpprefjp-autoupdate"
    git commit -a -m "update automatically"
    git push origin2 master
  popd

elif [[ $1 == --pull ]]; then
  if (($# < 6)); then
    printf '%s\n' \
      'build.sh: 引数の数が足りません。' \
      'usage: build.sh --pull PR SHA1 SHA2 BASE_URL TIME' \
      '  PR       プルリクエスト番号' \
      '  SHA1     プルリクエストの基底コミット' \
      '  SHA2     プルリクエストの先端コミット' \
      '  BASE_URL プレビューの基底URL' \
      '  TIME     プレビュー生成日時' \
      >&2
    exit 2
  fi

  target_directory=cpprefjp/gh-pages/gen/pull/$2
  rm -rf "$target_directory"
  mkdir -p "$target_directory"
  cp -r cpprefjp/cpprefjp.github.io/* "$target_directory"/

  (
    cd cpprefjp/site
    sha1=$3
    sha2=$4
    base_url=$5
    time=$6

    # todo (そもそも何故必要?)
    # git remote add base '${{ github.event.pull_request.base.repo.clone_url }}'
    # git fetch base '${{ github.event.pull_request.base.ref }}'

    #:zap: [**プレビュー (HTML)**](${{ steps.vars.outputs.base_url }})

    echo "## PR [\#$pr](https://github.com/cpprefjp/site/pull/$pr) 変更記事一覧 (更新時刻: $time)" #todo
    echo "- **⫯** Changes: [\`${sha1::7}..${sha2::7}\`](https://github.com/cpprefjp/site/compare/$sha1..$sha2)" #todo

    # - **⫯** Commit: ${{ steps.vars.outputs.sha }}
    # - プレビューの生成には時間がかかります (3～5分)。進捗状況は[こちら](https://github.com/${{ steps.vars.outputs.repo_full }}/actions?query=event%3Apull_request_target+branch%3A${{ steps.vars.outputs.ubranch }})をご確認ください。
    # #### 変更記事一覧
    # ${{ steps.file_list.outputs.content }}

    content=$(
      git diff --name-status --diff-filter=dr "$sha1" "$sha2" |
        sed -n '
          # normalize the line format
          s/^[[:space:]]*\([^[:space:]]\{1,\}\)[[:space:]]\{1,\}/\1 /

          # exclude filenames containing special characters that may break Markdown
          /[][`()]/d

          # exclude README.md
          /^[^[:space:]]* README\.md$/d

          # generate list items
          s|^A \(.*\)\.md$|- :memo: [`\1`]('"$base_url"'/\1.html) :sparkles:|p
          s|^[^[:space:]]* \(.*\)\.md$|- :memo: [`\1`]('"$base_url"'/\1.html)|p
        '
    )
    [[ $content ]] || content='- (内容変更された `.md` ファイルはありません)'

  ) > "$target_directory"/CHANGES.md

else
  printf '%s\n' "build.sh: コマンドライン引数が認識できません: $1" >&2
  exit 2

fi
