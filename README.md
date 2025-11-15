![Windrecorder](https://github.com/yuka-friends/Windrecorder/blob/main/__assets__/product-header-en.jpg)
<h1 align="center"> 🦝 Windrecorder | パーソナルメモリー検索エンジン</h1>
<p align="center"> Windows向けのオープンソースメモリー検索アプリ。Macアプリ <a href="https://www.rewind.ai/">Rewind</a> / Copilot Recall の代替ツールとして、記憶の手がかりを検索できます。</p>

<p align="center"> <a href="#english">English</a>  | <a href="https://github.com/yuka-friends/Windrecorder/blob/main/__assets__/README-sc.md">简体中文</a></p>

---

Windrecorderは、画面のすべてを小さなサイズで記録し、見たものを巻き戻したり、OCRテキストや画像の説明で検索したり、アクティビティ統計を取得できるメモリー検索アプリです。すべての機能は完全にローカルで動作し、インターネット接続やデータのアップロードは不要です。あなたのデータはすべてあなたのものです。

![Windrecorder](https://github.com/yuka-friends/Windrecorder/blob/main/__assets__/product-preview-en.jpg)

**Windrecorderの主な機能:**
- 複数または単一の画面、またはアクティブウィンドウのみを記録。小さなファイルサイズと低いシステムリソースで、安定した連続キャプチャとライブ映像の巻き戻し機能を実現
- 変更されたシーンのみをインデックス化し、OCRテキスト、ページタイトル、ブラウザURLなどの情報をデータベースに更新。カスタムスキップ条件（ウィンドウタイトル、プロセス名、含まれるテキスト、または画面静止時間による）。誰もコンピューターを使用していないときに、データベースを自動的にメンテナンスし、ビデオをクリーンアップ・圧縮
- 完全なWebUIインターフェース。画面を確認し、OCR/画像セマンティクスなどのクエリを実行可能
- アクティビティ統計、ワードクラウド、タイムライン、ライトボックス、散布図などのデータサマリーを提供。AI（LLM）を使用したタグ要約をサポート
- 複数言語をサポート。現在組み込み済み: 簡体字中国語、英語、日本語。多言語翻訳の貢献を歓迎します
- Windows組み込みの認識機能に加えて、他のサードパーティOCRエンジンもサポート（[パフォーマンステスト参考](https://github.com/yuka-friends/Windrecorder/blob/main/__assets__/third_party_ocr_engine_benchmark_reference.md)）:
     - [Rapid OCR](https://github.com/RapidAI/RapidOCR)、Paddle OCRのonnxruntime版
     - [WeChat OCR](https://github.com/kanadeblisst00/wechat_ocr)、中国語と英語の認識精度が非常に高い
     - [Tesseract OCR](https://github.com/tesseract-ocr/tessdoc)、100以上の言語をサポートし、複数言語を同時に認識可能
     - [カスタムOCRの貢献](https://github.com/yuka-friends/Windrecorder/blob/main/extension/how_to_contribute_third_party_ocr_support.md)
- _近日公開予定... PRにご注目ください :)_

---

> [!WARNING]
> このプロジェクトはまだ開発の初期段階にあり、使用中にいくつかの小さな問題が発生する可能性があります。問題の報告、更新のフォロー、[Discussions](https://github.com/yuka-friends/Windrecorder/discussions)での議論やロードマップの開始を歓迎します。プロジェクトの最適化と構築、PR/コードレビューの提出も歓迎します。

# 🦝 インストール

- [ffmpeg](https://github.com/BtbN/FFmpeg-Builds/releases)をダウンロード（ダウンロードファイル名: `ffmpeg-master-latest-win64-gpl-shared.zip`）、`bin`ディレクトリ内のすべてのファイル（binディレクトリ自体を除く）を`C:\Windows\System32`（またはPATHにある他のディレクトリ）に展開

- [Git](https://git-scm.com/download/win)をインストール。次へをクリックするだけです

- [Python](https://www.python.org/ftp/python/3.11.7/python-3.11.7-amd64.exe)をインストール。インストール時に`Add python.exe to PATH`にチェックを入れることを確認してください
     - **現在、Python 3.12はサポートされていません**。上記のリンクが指すPython 3.11の使用を推奨します

- ファイルエクスプローラーで、Windrecorderをインストールするディレクトリに移動（十分なスペースがあるパーティションに配置することを推奨）、ターミナルコマンド `git clone https://github.com/yuka-friends/Windrecorder` でアプリをダウンロード

     - インストールしたいフォルダを開き、パスバーに`cmd`と入力してEnterキーを押すと、ターミナルで現在のディレクトリに移動します。その後、上記のコマンドを貼り付けてEnterキーを押して実行

- ディレクトリ内の`install_update.bat`を開いて、依存関係をインストールし、アプリを設定します。すべてがうまくいけば、使用を開始できます！


# 🦝 使い方

- ディレクトリ内の`start_app.bat`を開くと、ツールがシステムトレイで実行され、右クリックメニューから使用できます
- すべてのデータ（ビデオ、データベース、統計情報）はWindrecorderの`userdata`ディレクトリに保存されます。アプリの場所をコピーまたは移動する場合（たとえば、コンピューターを変更する場合）、ディレクトリ内の`.venv`を削除して移動し、`install_update.bat`を再実行して仮想環境をインストールして使用できます

> [!TIP]
> ベストプラクティス: WebUIで「システム起動時に実行」を設定すると、面倒なくすべてを記録できます。
>
> **画像に変更がない場合や画面がスリープしている場合、記録は自動的に一時停止します。コンピューターがアイドル状態で誰も使用していない場合、ツールは自動的にデータベースをメンテナンスし、期限切れのビデオを圧縮・クリーンアップします。**
>
> _設定して忘れるだけ！_

> [!NOTE]
> `start_app.bat`を開いた後にコマンドラインウィンドウが点滅し、**しばらくしてもWindrecorderがシステムトレイに表示されない場合**、ディレクトリに`hide_CLI_by_python.txt`という名前のファイルを作成し、`start_app.bat`を開いてもう一度試してください; [#232](https://github.com/yuka-friends/Windrecorder/issues/232)

# 🦝 動作原理
![Windrecorder](https://github.com/yuka-friends/Windrecorder/blob/main/__assets__/how-it-work-en.jpg)

Windrecorderは、利便性のために2つの記録モードを提供します:

1. **自動柔軟スクリーンショット**:

    記録を開始すると、Windrecorderは3秒ごと（デフォルト）にスクリーンショットを撮影し、コンテンツやテキストが変更されたときにインデックス化し、リアルタイムの巻き戻しを可能にします。さらに、15分ごとに、過去のスクリーンショットが自動的にビデオに変換されます。

    このオプションはシステムリソースの消費が少なく、記憶の手がかりを保存、巻き戻し、検索する必要があるユーザーに適しています。

2. **FFmpegによる直接ビデオ記録**:

    記録が開始されると、Windrecorderは15分のセグメントでビデオを記録し、記録完了後にビデオクリップをインデックス化します（そのため、データクエリに15分の遅延が発生する可能性があります）。

    このオプションは中程度のシステムリソースを消費し、コンピューターアクティビティのスムーズで完全な記録を可能にします。

画面が静止している場合、ウィンドウタイトルや画面コンテンツが除外リストにある場合、またはコンピューターがロック画面に入った場合、記録は自動的に一時停止し、アイドルメンテナンス（ビデオの圧縮とクリーンアップ、画像認識の埋め込みなど）を実行します。ユーザーが戻ってコンピューターの操作を続けるまで。

- _画像埋め込みは拡張機能として提供され、`extension/install_img_embedding_module`ディレクトリの下にインストールできます。_


| ビデオ記録サイズ                                                                                                                | SQLiteデータベースサイズ         |
|-------------------------------------------------------------------------------------------------------------------------------------|------------------------------|
| 1時間あたり: 2-100 Mb（画面変更数/モニター数による）                                                                    |                              |
| 1か月あたり: 10-20 Gb（画面時間による）  異なるビデオ圧縮プリセットで、これらのデータを0.1-0.7倍のサイズに圧縮可能 | 1か月あたり: 約160 Mb      |

# 🦝 Q&A | よくある質問

Q: 記録中にマウスポインターがちらつく（FFmpegによる直接ビデオ記録）

- A: これはWindowsの歴史的な問題です。[この投稿](https://stackoverflow.com/questions/34023630/how-to-avoid-mouse-pointer-flicker-when-capture-a-window-by-ffmpeg )の方法を試すことができます。要約:
     - 任意のhexエディタ（[HxD](https://mh-nexus.de/en/downloads.php?product=HxD20)など）を使用して、以前にダウンロードした`FFmpeg/bin`内の`avdevice-XX.dll`を開く
     - hexコード`20 00 cc 40`を検索し、`40`の最後の2桁を`00`に変更
     - ファイルを保存

Q: WebUIを開いたときに最近の期間にデータがない

- A: ツールがデータをインデックス化している場合、WebUIは最新の一時データベースファイルを作成しません。
解決策: しばらく待って、ツールのインデックス化が完了するのを待つか、WebUIインターフェースを更新するか、dbディレクトリ内の`_TEMP_READ.db`というサフィックスを持つデータベースファイルを削除して更新してください（データベースファイルの損傷プロンプトが表示されても心配しないでください。ツールがまだインデックス化中である可能性があります。しばらくしてから更新/削除を試してください）。この戦略は将来修正・リファクタリングされます。 [#26](https://github.com/yuka-friends/Windrecorder/issues/26)

Q: WebUIを開いたときに、`FileNotFoundError: [WinError 2] The system cannot find the file specified: './db\\user_2023-10_wind.db-journal'`というプロンプトが表示される

- A: 通常、WebUIに初めてアクセスするときに発生し、ツールがまだデータをインデックス化しています。
解決策: ツールのバックグラウンドインデックス化が完了した後、dbフォルダ内の`_TEMP_READ.db`というサフィックスを持つ対応するデータベースファイルを削除して更新してください。

Q: Windows.Media.Ocr.Cli OCRが利用できない/認識率が低すぎる

- A1: ターゲット言語の言語パック/入力メソッドがシステムに追加されているか確認してください: https://learn.microsoft.com/en-us/uwp/api/windows.media.ocr

- A2: `extension`ディレクトリにサードパーティOCRエンジンをインストールしてください。通常、認識精度が高く、複数言語の同時認識をサポートしますが、パフォーマンスを少し消費する可能性があります

# 🧡
以下のプロジェクトに感謝します

- https://github.com/DayBreak-u/chineseocr_lite
- https://github.com/zh-h/Windows.Media.Ocr.Cli
- https://github.com/kanadeblisst00/wechat_ocr
- https://github.com/tesseract-ocr/tessdoc
- https://github.com/unum-cloud/uform
- https://github.com/streamlit/streamlit


---

🧡 このツールが気に入りましたか？ [YUKA NAGASE](https://www.youtube.com/channel/UCf-PcSHzYAtfcoiBr5C9DZA)の優しい音楽もYoutubeやストリーミング音楽プラットフォームでチェックしてください！

> "Your tools suck, check out my girl Yuka Nagase, she's amazing, I code 10 times faster when listening to her." -- @jpswing
---
**Windrecorder**をProduct Huntで投票:

<a href="https://www.producthunt.com/posts/windrecorder?utm_source=badge-featured&utm_medium=badge&utm_souce=badge-windrecorder" target="_blank"><img src="https://api.producthunt.com/widgets/embed-image/v1/featured.svg?post_id=441411&theme=neutral" alt="Windrecorder - search&#0032;&#0038;&#0032;rewind&#0032;everything&#0032;happened&#0032;on&#0032;your&#0032;screen | Product Hunt" style="width: 250px; height: 54px;" width="250" height="54" /></a>

---

### 🧠 Windrecorder以外に、同様の機能を提供する他のツールは？

自由に補足してください。あなたに合ったツールを見つけることを願っています:

- クロスプラットフォームデスクトップ:
     - (オープンソース) https://github.com/louis030195/screen-pipe
     - (オープンソース) https://github.com/jasonjmcghee/xrem
     - (オープンソース) https://github.com/openrecall/openrecall
- Windows:
     - (商用) https://timesnapper.com/
     - (商用) https://www.manictime.com/
     - (商用) https://apse.io/
     - (商用) https://www.screen-record.com/screen_anytime.htm
- Linux:
     - (オープンソース) https://github.com/apirrone/Memento
- MacOS:
     - (オープンソース) https://github.com/jasonjmcghee/rem
     - (商用) https://screenmemory.app
     - (商用) https://www.rewind.ai/
- Android:
     - (無料、アプリ内購入) https://play.google.com/store/apps/details?id=io.github.mthli.snapseek

HackerNewsでのより多くの研究と議論:
- https://news.ycombinator.com/item?id=38787892
- https://news.ycombinator.com/item?id=40105371

---

<a id="english"></a>
# English

![Windrecorder](https://github.com/yuka-friends/Windrecorder/blob/main/__assets__/product-header-en.jpg)
<h1 align="center"> 🦝 Windrecorder | Personal Memory Search Engine</h1>
<p align="center"> An Open Source Mac App <a href="https://www.rewind.ai/">Rewind</a> / Copilot Recall alternative tool on Windows to help you retrieve memory cues.</p>

<p align="center"> <a href="https://github.com/yuka-friends/Windrecorder/blob/main/README.md">English</a>  | <a href="https://github.com/yuka-friends/Windrecorder/blob/main/__assets__/README-sc.md">简体中文</a></p>

---

Windrecorder is a memory search app by records everything on your screen in small size, to let you rewind what you have seen, query through OCR text or image description, and get activity statistics. All its capabilities run completely locally, without the need for an Internet connection or uploading any data, you should own all your data.

![Windrecorder](https://github.com/yuka-friends/Windrecorder/blob/main/__assets__/product-preview-en.jpg)

**Windrecorder currently does:**
- Record multiple or single screens, or just the active window, with smaller file sizes and lower system resources, ensuring stable, continuous capture and the ability to rewind live footage;
- Only index the changed scenes and update the OCR text, page title, browser url and other information to the database; Custom skip conditions (by window title, process name, included text, or screen still time); Automatically maintain the database, clean and compress the video when no one is using the computer;
- Complete webui interface, which can review the screen, conduct OCR/image semantics and other queries;
- Provide data summaries such as activity statistics, word clouds, timelines, light boxes, scatter plots, etc.; Supports tags summarization using AI (LLM).
- Supports multiple languages. Currently built-in: Simplified Chinese, English, and Japanese. Welcome to contribute multilingual translations and help us improve copywriting quality;
- In addition to Windows' built-in recognition capabilities, it also supports other third-party OCR engines ([performance test reference](https://github.com/yuka-friends/Windrecorder/blob/main/__assets__/third_party_ocr_engine_benchmark_reference.md)), currently including:
     - [Rapid OCR](https://github.com/RapidAI/RapidOCR), based onnxruntime version of Paddle OCR;
     - [WeChat OCR](https://github.com/kanadeblisst00/wechat_ocr), with extremely high Chinese and English recognition accuracy;
     - [Tesseract OCR](https://github.com/tesseract-ocr/tessdoc), supports more than 100 languages ​​and can recognize multiple languages ​​at the same time;
     - [Contribute custom OCR](https://github.com/yuka-friends/Windrecorder/blob/main/extension/how_to_contribute_third_party_ocr_support.md)
- _coming soon... pay attention to our PR :)_

---

> [!WARNING]
> This project is still in the early stages of development, and you may encounter some minor problems in experience and use, feel free to submit issue feedback, follow updates, and initiate discussions or roadmap in [Discussions](https://github.com/yuka-friends/Windrecorder/discussions). You are also welcome to help us optimize and build the project, submit PR / code review.

# 🦝 Installation

- Download [ffmpeg](https://github.com/BtbN/FFmpeg-Builds/releases) (the download file name is: `ffmpeg-master-latest-win64-gpl-shared.zip`), extract all files in `bin` directory(excluding the bin directory itself) to `C:\Windows\System32` (or other directories located in PATH)

- Install [Git](https://git-scm.com/download/win), just keep clicking next step.

- Install [Python](https://www.python.org/ftp/python/3.11.7/python-3.11.7-amd64.exe), make sure to check `Add python.exe to PATH` when installing.
     - **Currently, Python 3.12 is not supported**. It is recommended to use python 3.11, which is the version pointed to by the link above.

- In file explorer, navigate to the directory where you want to install Windrecorder (it is recommended to place it in a partition with sufficient space), and download the app through the terminal command `git clone https://github.com/yuka-friends/Windrecorder`

     - You can open the folder you want to install, enter `cmd` in the path bar and press Enter, and you will be located into current directory in terminal, then paste the above command and press Enter to execute;

- Open `install_update.bat` in the directory to install dependencies and configure the app. If everything goes well, you can start using it!


# 🦝 How to use

- Open `start_app.bat` in the directory, the tool will run on the system tray and be used through the right-click menu;
- All data (video, database, statistical information) will be stored in `userdata` directory under Windrecorder. If you want to copy or move the app location (for example, if you change the computer), you can delete `.venv` in the directory and moved, then re-run `install_update.bat` to install the virtual environment to use it;

> [!TIP]
> Best practice: Set `Run on system startup` in webui to record everything without any fuss.
>
> **Recording will be automatically paused when there is no change in the picture or the screen is sleeping. When the computer is idle and no one is using it, the tool will automatically maintain the database, compress, and clean up expired videos.**
>
> _Just set it and forget it!_

> [!NOTE]
> If the command line window flashes after opening `start_app.bat` and **Windrecorder still does not appear in the system tray after a while**, please create a file named `hide_CLI_by_python.txt` in the directory and open `start_app.bat` and try again; [#232](https://github.com/yuka-friends/Windrecorder/issues/232)

# 🦝 How it works
![Windrecorder](https://github.com/yuka-friends/Windrecorder/blob/main/__assets__/how-it-work-en.jpg)

Windrecorder offers two recording modes for your convenience:

1. **Automatic Flexible Screenshots**:

    Upon starting the recording, Windrecorder takes screenshots every 3 seconds (by default), indexing them when content or text changes, allowing real-time rewind. Additionally, every 15 minutes, past screenshots are automatically converted into videos.

    This option consumes low system resources and is suitable for users who need to store, rewind, and search for memory cues.

2. **Direct Video Recording via FFmpeg**:

    When recording begins, Windrecorder records video in 15-minute segments, indexing the video clips after recording completion (hence, there may be a 15-minute delay in data querying).

    This option consumes moderate system resources and enables smooth and complete recording of computer activities.

When the screen remains static, window titles or screen content are on the exclusion list, or the computer enters lock screen, recording pauses automatically and performs idle maintenance (compressing and cleaning videos, conducting image recognition embedding, etc.) until the user returns to continue operating the computer.

- _Image Embedding is provided as an extension and can be installed under the directory `extension/install_img_embedding_module`._


| Video recording size                                                                                                                | SQlite database size         |
|-------------------------------------------------------------------------------------------------------------------------------------|------------------------------|
| Per Hour: 2-100 Mb (depends on screen change\number of monitors)                                                                    |                              |
| Per Month: 10-20 Gb (depends on screen time)  Different video compression presets can compress these data to 0.1-0.7 times the size | Per Month: About 160 Mb      |

# 🦝 Q&A | Frequently Asked Questions

Q: The mouse pointer flicker during recording (Direct Video Recording via FFmpeg)

- A: It's a Windows historical issues, you can try [this post](https://stackoverflow.com/questions/34023630/how-to-avoid-mouse-pointer-flicker-when-capture-a-window-by-ffmpeg ) method to solve. TL;DR:
     - Use any hex editor (such as [HxD](https://mh-nexus.de/en/downloads.php?product=HxD20)) to open `avdevice-XX.dll` in the previously downloaded `FFmpeg/bin`;
     - Search for hex code `20 00 cc 40` and change the last two digits of `40` to `00`;
     - Save the file;

Q: There is no data in the recent period when opening webui.

- A: When the tool is indexing data, webui will not create the latest temporary database file.
Solution: Try to wait for a while, wait for the tool indexing to complete, refresh the webui interface, or delete the database file with the suffix _TEMP_READ.db in the db directory and refresh it (if there is a database file damage prompt, don't worry, it may be The tool is still in the index, please try refreshing/removing it after some time). This strategy will be fixed and refactored in the future. [#26](https://github.com/yuka-friends/Windrecorder/issues/26)

Q: When opening webui, it prompts: `FileNotFoundError: [WinError 2] The system cannot find the file specified: './db\\user_2023-10_wind.db-journal'`

- A: Usually occurs when accessing the webui for the first time, while the tool is still indexing data.
Solution: After the tool background indexing is completed, delete the corresponding database file with the suffix _TEMP_READ.db in the db folder and refresh it.

Q: Windows.Media.Ocr.Cli OCR is not available/the recognition rate is too low

- A1: Check whether the language pack/input method of the target language has been added to the system: https://learn.microsoft.com/en-us/uwp/api/windows.media.ocr

- A2: Install a third-party OCR engine in the `extension` directory. They usually have higher recognition accuracy and support simultaneous recognition of multiple languages, but may take up slightly more performance;

# 🧡
Thanks to the following projects

- https://github.com/DayBreak-u/chineseocr_lite
- https://github.com/zh-h/Windows.Media.Ocr.Cli
- https://github.com/kanadeblisst00/wechat_ocr
- https://github.com/tesseract-ocr/tessdoc
- https://github.com/unum-cloud/uform
- https://github.com/streamlit/streamlit


---

🧡 Like this tool? Also check out [YUKA NAGASE](https://www.youtube.com/channel/UCf-PcSHzYAtfcoiBr5C9DZA)'s gentle music on Youtube and streaming music platforms, thank ya!

> "Your tools suck, check out my girl Yuka Nagase, she's amazing, I code 10 times faster when listening to her." -- @jpswing
---
Vote **Windrecorder** on Product Hunt:

<a href="https://www.producthunt.com/posts/windrecorder?utm_source=badge-featured&utm_medium=badge&utm_souce=badge-windrecorder" target="_blank"><img src="https://api.producthunt.com/widgets/embed-image/v1/featured.svg?post_id=441411&theme=neutral" alt="Windrecorder - search&#0032;&#0038;&#0032;rewind&#0032;everything&#0032;happened&#0032;on&#0032;your&#0032;screen | Product Hunt" style="width: 250px; height: 54px;" width="250" height="54" /></a>

---

### 🧠 In addition to Windrecorder, what other tools provide similar functions?

Feel free to supplement, and hope you find the tool that suits you:

- Cross-platform Desktop:
     - (open source) https://github.com/louis030195/screen-pipe
     - (open source) https://github.com/jasonjmcghee/xrem
     - (open source) https://github.com/openrecall/openrecall
- Windows:
     - (commercial) https://timesnapper.com/
     - (commercial) https://www.manictime.com/
     - (commercial) https://apse.io/
     - (commercial) https://www.screen-record.com/screen_anytime.htm
- Linux:
     - (open source) https://github.com/apirrone/Memento
- MacOS:
     - (open source) https://github.com/jasonjmcghee/rem
     - (commercial) https://screenmemory.app
     - (commercial) https://www.rewind.ai/
- Android:
     - (free, in-app purchases) https://play.google.com/store/apps/details?id=io.github.mthli.snapseek

For more research and discussion on HackerNews:
- https://news.ycombinator.com/item?id=38787892
- https://news.ycombinator.com/item?id=40105371
