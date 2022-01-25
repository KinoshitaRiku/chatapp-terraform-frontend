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