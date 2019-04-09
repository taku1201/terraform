## terraform
### :notebook_with_decorative_cover: このレポジトリについて

TerraformでAWS基盤を構築するための設定をホストしてます。

#### environments

各環境ごとの設定値、どのモジュールを使うかなどの設定がはいってます。

#### modules

構成定義の実態をざっくりと機能ごとに分けていれてます。

### :rocket: 使い方

```
git clone https://github.com/taku1201/terraform.git
cd terraform/environments/{development|production}
terraform init
terraform plan (-target module.xxxx ...)
terraform apply (-target module.xxxx ...)
```