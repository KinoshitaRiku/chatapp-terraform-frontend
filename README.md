# DONE
## terraform
- s3にバケットを作成。
- cloudfrontで静的ウェブサイトのコンテンツ配信を高速化(エッジローケーション)
- lamdbaでキャッシュのクリア, 更新後に即時反映
- 

## その他
- お名前.comでドメインの取得
- ACM(region:us-east-1)でssl証明の発行
- お名前.comにネームサーバー情報を追加する

# terraform
・terraformCloudでこのリポジトリのmainブランチに変更があれば動作する<br>
・variables.tfの値は、terraformCloudのvariablesに設定<br>

# aws
・S3を用いて静的webサイトをホスティング<br>
・cloudFrontとlambdaを用いて、高速に表示かつキャッシュの削除を行う<br>
・route53は未設定

## cicd
・任意のgithubリポジトリにmainブランチに変更があれば動作する<br>
・管理をcodePipelineで行い、codeBuildでdistファイルを作成