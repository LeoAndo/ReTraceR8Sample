# ReTraceR8Sample
Sample to retrace R8 encrypted project

# Overview
本プロジェクトでは暗号化されたコードのクラッシュログのretrace方法を説明します。<br>

`androidX Navigation`の [2.4.0-alpha02](https://developer.android.com/jetpack/androidx/releases/navigation?hl=ja#2.4.0-alpha02)では、[NavArgsLazy](https://developer.android.com/reference/kotlin/androidx/navigation/NavArgsLazy)の中の処理で、<br>
暗号化エラーが起きるバグがあるので、そのバグを利用してretrace方法を説明します。<br>

# Development environment
<img width="646" alt="スクリーンショット 2021-06-14 13 38 53" src="https://user-images.githubusercontent.com/16476224/122934038-21ce4780-d3aa-11eb-99d5-6246cd0dfb39.png">

<img width="580" alt="スクリーンショット 2021-06-22 22 36 40" src="https://user-images.githubusercontent.com/16476224/122934231-517d4f80-d3aa-11eb-9a96-9a44e27c1d08.png">


# Prepare
- retrace Toolをインストールする
- retraceできるように、以下の暗号化設定を行う
  - https://github.com/LeoAndo/ReTraceR8Sample/blob/main/app/proguard-rules.pro#L4

# This Application Structure
- retrace Tool
  - https://github.com/LeoAndo/ReTraceR8Sample/blob/main/tools/proguard-7.1.0-beta5/bin/retrace.sh
- mapping.txt (リリースビルド時に生成される暗号化関連のmappingファイル)
  - https://github.com/LeoAndo/ReTraceR8Sample/blob/main/outputs/mapping/release/mapping.txt 
- stacktrace.txt (クラッシュ時の暗号化されたログ)
  - https://github.com/LeoAndo/ReTraceR8Sample/blob/main/stacktrace.txt 

# Usage
1. 署名付きリリースビルドしてapkファイルを作成する
2. Android deviceにapkをインストールする
3. アプリケーションがクラッシュ！
4. Logcatからクラッシュ時のstacktraceをコピーする
<img width="1298" alt="1" src="https://user-images.githubusercontent.com/16476224/122935248-27785d00-d3ab-11eb-89a3-8d6e75377460.png">
<img width="1297" alt="2" src="https://user-images.githubusercontent.com/16476224/122935261-2a734d80-d3ab-11eb-8f3a-39d111dccd77.png">
5. 手順４でコピーしたテキストをテキストファイルにコピーする。(今回の例では`stacktrace.txt`)
<img width="1306" alt="3" src="https://user-images.githubusercontent.com/16476224/122935459-5098ed80-d3ab-11eb-8a37-3b04212f470f.png">
6. retraceツールを実行する
<img width="1273" alt="4" src="https://user-images.githubusercontent.com/16476224/122935413-47a81c00-d3ab-11eb-9ba9-6d0eb5903781.png">
7. ログ解析する
<img width="1293" alt="5" src="https://user-images.githubusercontent.com/16476224/122935756-905fd500-d3ab-11eb-8aa1-313a37e9b775.png">
8. 問題のコードを解析する
<img width="1313" alt="6" src="https://user-images.githubusercontent.com/16476224/122935832-9f468780-d3ab-11eb-8d4b-bf93c1c6c55b.png">

# Bug Fix (R8)
https://github.com/LeoAndo/ReTraceR8Sample/pull/1
