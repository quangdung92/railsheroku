var I18n = I18n || {};
I18n.translations = {"ja":{"faker":{"address":{"postcode":["###-####"],"state":["北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県","茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県","新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県","静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県","奈良県","和歌山県","鳥取県","島根県","岡山県","広島県","山口県","徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県","熊本県","大分県","宮崎県","鹿児島県","沖縄県"],"state_abbr":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47"],"city_prefix":["北","東","西","南","新","湖","港"],"city_suffix":["市","区","町","村"],"city":["#{city_prefix}#{Name.first_name}#{city_suffix}","#{Name.first_name}#{city_suffix}","#{city_prefix}#{Name.last_name}#{city_suffix}","#{Name.last_name}#{city_suffix}"],"street_name":["#{Name.first_name}#{street_suffix}","#{Name.last_name}#{street_suffix}"]},"phone_number":{"formats":["0####-#-####","0###-##-####","0##-###-####","0#-####-####"]},"cell_phone":{"formats":["090-####-####","080-####-####","070-####-####"]},"name":{"last_name":["佐藤","鈴木","高橋","田中","渡辺","伊藤","山本","中村","小林","加藤","吉田","山田","佐々木","山口","斎藤","松本","井上","木村","林","清水"],"first_name":["大翔","蓮","颯太","樹","大和","陽翔","陸斗","太一","海翔","蒼空","翼","陽菜","結愛","結衣","杏","莉子","美羽","結菜","心愛","愛菜","美咲"],"name":["#{last_name} #{first_name}"]}},"date":{"abbr_day_names":["日","月","火","水","木","金","土"],"abbr_month_names":[null,"1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"],"day_names":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"formats":{"default":"%Y/%m/%d","long":"%Y年%m月%d日(%a)","short":"%m/%d","date":"%Y年%m月%d日"},"month_names":[null,"1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"],"order":["year","month","day"]},"datetime":{"distance_in_words":{"about_x_hours":{"one":"約1時間","other":"約%{count}時間"},"about_x_months":{"one":"約1ヶ月","other":"約%{count}ヶ月"},"about_x_years":{"one":"約1年","other":"約%{count}年"},"almost_x_years":{"one":"1年弱","other":"%{count}年弱"},"half_a_minute":"30秒前後","less_than_x_minutes":{"one":"1分以内","other":"%{count}分未満"},"less_than_x_seconds":{"one":"1秒以内","other":"%{count}秒未満"},"over_x_years":{"one":"1年以上","other":"%{count}年以上"},"x_days":{"one":"1日","other":"%{count}日"},"x_minutes":{"one":"1分","other":"%{count}分"},"x_months":{"one":"1ヶ月","other":"%{count}ヶ月"},"x_seconds":{"one":"1秒","other":"%{count}秒"}},"prompts":{"day":"日","hour":"時","minute":"分","month":"月","second":"秒","year":"年"}},"errors":{"format":"%{attribute}%{message}","messages":{"accepted":"を受諾してください。","blank":"を入力してください。","present":"は入力しないでください。","confirmation":"と%{attribute}の入力が一致しません。","empty":"を入力してください。","equal_to":"は%{count}にしてください。","even":"は偶数にしてください。","exclusion":"は予約されています。","greater_than":"は%{count}より大きい値にしてください。","greater_than_or_equal_to":"は%{count}以上の値にしてください。","inclusion":"は一覧にありません。","invalid":"は不正な値です。","less_than":"は%{count}より小さい値にしてください。","less_than_or_equal_to":"は%{count}以下の値にしてください。","not_a_number":"は数値で入力してください。","not_an_integer":"は整数で入力してください。","odd":"は奇数にしてください。","record_invalid":"バリデーションに失敗しました。 %{errors}","restrict_dependent_destroy":"%{record}が存在しているので削除できません。","taken":"はすでに存在します。","too_long":"は%{count}文字以内で入力してください。","too_short":"は%{count}文字以上で入力してください。","wrong_length":"は%{count}文字で入力してください。","other_than":"は%{count}以外の値にしてください。"},"template":{"body":"次の項目を確認してください。","header":{"one":"%{model}にエラーが発生しました。","other":"%{model}に%{count}個のエラーが発生しました。"}}},"helpers":{"select":{"prompt":"選択してください。"},"submit":{"create":"登録する","submit":"保存する","update":"更新する"}},"number":{"currency":{"format":{"delimiter":",","format":"%n%u","precision":0,"separator":".","significant":false,"strip_insignificant_zeros":false,"unit":"円"}},"format":{"delimiter":",","precision":3,"separator":".","significant":false,"strip_insignificant_zeros":false},"human":{"decimal_units":{"format":"%n %u","units":{"billion":"十億","million":"百万","quadrillion":"千兆","thousand":"千","trillion":"兆","unit":""}},"format":{"delimiter":"","precision":3,"significant":true,"strip_insignificant_zeros":true},"storage_units":{"format":"%n%u","units":{"byte":"バイト","gb":"ギガバイト","kb":"キロバイト","mb":"メガバイト","tb":"テラバイト"}}},"percentage":{"format":{"delimiter":"","format":"%n%"}},"precision":{"format":{"delimiter":""}}},"support":{"array":{"last_word_connector":"と","two_words_connector":"と","words_connector":"と"}},"time":{"am":"午前","formats":{"default":"%Y/%m/%d %H:%M:%S","long":"%Y年%m月%d日(%a) %H時%M分%S秒 %z","short":"%y/%m/%d %H:%M","time":"%H時%M分","scheduled_time":"%-H時間%M分","scheduled_time_short":"%M分"},"pm":"午後","scheduled_time":{"and_under":"%{time}以下","and_over":"%{time}以上"}},"i18n":{"plural":{"keys":["other"],"rule":{}}},"hello":"Hello world","home":{"unresolved":{"ai":{"me":{"title":"あなたの未解決A/I","nothing":"現在、あなたの未解決A/Iはありません。"},"meeting":{"title":"参加会議の未解決A/I","nothing":"現在、参加会議の未解決A/Iはありません。"}}},"meeting":{"ended":{"title":"終了会議議事録","nothing":"現在、関連する終了会議議事録はありません。"},"scheduled":{"title":"開催予定会議","nothing":"現在、関連する開催予定会議はありません。"}},"new":{"information":"What's New","list":{"create_meeting":"%{user_name}さんが%{meeting_name}会議を作成しました。","ended_meeting":"%{meeting_name}会議が終了しました。","edit_meeting":"%{user_name}さんが%{meeting_name}会議を編集しました。","meeting_today":"%{meeting_name}会議の開催予定日です。","canceled_meeting":"%{meeting_name}会議は中止になりました。","comment":"%{user_name}さんが%{meeting_name}議事録にコメントしました。","beforer_action_item_scheduled_date":"もうすぐ%{meeting_name}議事録の%{ai_name}A/I対応予定日です。","action_item_scheduled_date":"%{meeting_name}議事録の%{ai_name}A/I対応予定日です。","action_item_ended":"%{user_name}さんが%{ai_name}A/Iを完了しました。"}},"ai":{"achievement-rate":"あなたのA/I達成率は%{rate}です。(%{ai}/%{all})","nothing":"現在あなたのA/Iはありません"},"button":{"meeting":{"new":"新規会議の登録"}},"search":{"meeting-name":"会議名","freeword":"フリーワード","date":"開催日","kind":"会議種別","select":{"default":"全て"},"button":{"clear":"クリア"}},"list":{"view":"もっと見る"}},"default":{"message":{"loading":"Loading"},"button":{"logout":"ログアウト","admin-setting":"管理設定"}},"admin":{"menu":{"user":"ユーザ","kind":"会議種別","cybozu":"サイボウズ","home":"ホーム画面へ","setting":"通知設定"},"button":{"list":"一覧","new":"作成","detail":"詳細","show":"表示","edit":"編集","delete":"削除","disable":"無効"},"dialog":{"message":{"disable":"を無効にします。宜しいですか？"}},"pagination":{"previous":"前へ","next":"次へ","first":"最初","last":"最後"},"table-info":{"disable":"無効","not-login":"未ログイン"},"page":{"kind":{"new":"会議種別作成","index":"会議種別一覧","edit":"会議種別編集","show":"会議種別表示","delete":"会議種別削除","deleted":"○","participant":"参加者","observer":"オブザーバ","agenda_template":"アジェンダ","agenda_add":"アジェンダ追加","agenda_id":"ID","agenda_content":"設備/指摘","agenda_operation":"操作"}}},"login":{"title":"ログイン","placeholder":{"user_id":"ユーザIDを入力","password":"パスワードを入力"},"label":{"user_id":"ユーザID","password":"パスワード"},"btn":{"login":"ログイン"},"message":{"login_error":"ログインできません。"},"select":{"option":{"english":"英語","japanese":"日本語","vietnamese":"ベトナム語"}}},"firstlogin":{"placeholder":{"new_password":"新しいパスワードを入力","confirm_password":"確認用パスワードを入力"},"label":{"user_id":"ユーザID"},"title":"パスワード設定","explain":{"password":"パスワードは4～16文字 半角英数で入力下さい"},"btn":{"regist":"登録","cancel":"キャンセル"},"message":{"not_match":"新しいパスワードと確認用パスワードが一致しません。","not_input":"新しいパスワードを入力して下さい。"},"update":{"notice":"User was successfully updated."}},"validate":{"date":"(?:19|20)[0-9]{2}/(?:(?:0[1-9]|1[0-2])/(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])/(?:30))|(?:(?:0[13578]|1[02])/31))","user":{"email":"メールアドレスの型式が不正です。","kana":"全角ひらがなで入力して下さい。","password":"パスワードは半角英数字で入力して下さい。","cybozu_id":"半角英数字で入力して下さい。"}},"button":{"disable_with":"送信中..."},"error":{"cybozu":"[サイボウズ連携エラー]","stale":"競合が発生しました、一度キャンセルしてから編集して下さい。","error":"エラー","warning":"警告","success":"成功"},"common":{"label":{"row_description":"行の説明:","browse":"参照"},"datepicker":{"datepicker-popup":"yyyy/MM/dd","format-day-title":"yyyy年 MM月","close-text":"閉じる","current-text":"当日","clear-text":"削除","placeholder":"yyyy/mm/dd"},"dialog":{"title":{"confirm":"確認"}}},"views":{"proceedings":{"common":{"label":{"seq":"項番","action-item":"A/I","person-in-charge":"担当者","scheduled-date":"対応予定日","completion-date":"完了日","operation":"操作"},"balloon_help":{"meeting_information":"会議情報を表示します。会議情報の文字か、右の矢印をクリックすると、会議情報欄を閉じたり開いたりすることができます。","file":"会議の資料が表示されます。資料を追加したり、削除することができます。","add_file":"資料を追加します。","delete_file":"資料を削除します。","export_pdf":"会議の内容をPDFで保存します。","print":"会議の内容を印刷します。","back":"前の画面に戻ります。"}},"error-message":{"meeting-is-completed":"%{meeting_name}会議は終了しています。","meeting-is-not-completed":"%{meeting_name}会議は終了されていません。","meeting-is-canceled":"%{meeting_name}会議はキャンセルされています。"},"comment":{"label":{"comment":"コメント","explain":"※Shift+Enterキーで改行　Enterキーで書き込み "},"button":{"write":"書き込む","confirm":"確認"},"placeholder":{"comment":"コメントを入力"},"js":{"alert":{"please_input_comment":"コメントを入力して下さい。"},"label":{"comment_user":"%{user_name}さんのコメント","confirmed_comment":"%{all_user_count}名中%{comment_user_count}名が確認済み。"}}},"file":{"uploding":"アップロード中：","js":{"alert":{"file_upload_error":"ファイルのアップロードでエラーが発生しました。","file_upload_success":"ファイルのアップロードが完了しました。","please_select_upload_file":"アップロードするファイルを選択して下さい。","please_input_annotation":"注釈を入力して下さい。","same file name":"同じ名前のファイルがすでにあります。"},"confirm":{"delete_file":"%{filename}を削除します。\nよろしいでしょうか?"}}},"confirm":{"title":"%{meeting_name}会議終了確認","button":{"print":"印刷","back":"戻る","ended":"会議終了","export":"PDFで保存"},"dialog":{"confirm":"会議を終了します。宜しいですか？","confirm_revert":"議事録を差し戻します。\n宜しいですか？"},"label":{"seq":"項番","meeting-info":"会議情報","proceeding-content":"議事録内容"},"balloon_help":{"meeting_content":"議事録の内容(アジェンダ、A/I)が表示されます。","file":"会議の資料が表示されます。","meeting_end_confirm":"会議を終了します。議事録の内容は変更できなくなりますのでご注意ください!"}},"edit":{"title":"%{kind_name}%{meeting_name}会議 議事録開催","button":{"add-agenda":"アジェンダ追加","add-action-item":"A/I追加","set-title-of-agenda":"タイトル","unset-title-of-agenda":"アジェンダタイトルを解除","set-list-of-agenda":"箇条書き","unset-list-of-agenda":"箇条書きを解除","add-file":"追加","edit":"変更","delete":"削除","regist":"登録","confirm-end":"終了確認","cancel":"キャンセル","search":"会議検索","meeting-look":"会議参照","prev":"戻る","home":"ホームへ","upload":"アップロード","update":"更新"},"dialog":{"agenda-not-delete":"このアジェンダに対してA/Iが登録されている為削除できません。"},"label":{"meeting-name":"会議名","meeting-related-meeting-name":"関連会議名","meeting-start-date":"開催日","meeting-start-time":"開始予定時刻","meeting-scheduled-time":"予定時間","meeting-venue":"開催場所","meeting-message":"参加者へのメッセージ","participant":"参加者","observer":"オブザーバー","proceeding-content":"議事録内容","agenda":"アジェンダ","agenda-index":"アジェンダ項番","action-item":"A/I","seq":"項番","file-name":"ファイル名","annotation":"注釈","meeting-info":"会議情報","id":"ID","agenda-content":"協議内容/指摘/決定事項","operation":"操作","person-in-charge":"担当者","scheduled-date":"対応予定日","file":"資料","update_observer":"オブザーバー変更"},"file":{"message":{"warning":"PDF以外のファイルです。","error":"すでに同じ名前のファイルがあります。"}},"placeholder":{"annotation":"注釈を必ず入力して下さい。"},"tooltip":{"agenda-add":"アジェンダ追加","file-add":"資料追加"},"error-message":{"content-is-blank":"入力されていないアジェンダが存在します。\\n削除するか入力を行ってください。"},"js":{"alert":{"ai_deleted":"A/Iは既に削除されています。","ai_multiple_deleted":"複数のA/Iが削除されました。\n削除AI数=%{deleted_ai_count}","please_select":"選択して下さい。","please_select_ai_text":"アジェンダから、A/Iとするテキストを選択してください。","selection_to_contain_the_ai":"選択範囲にAIが含まれています。","agenda_not_delete":"このアジェンダに対してA/Iが登録されている為、アジェンダを削除できません。\n削除するアジェンダに関連するA/Iを全て削除して下さい。","to_ai_not_drag_and_drop":"AIに対してはドラッグ\u0026ドロップできません。"},"confirm":{"ai_delete":"%{no}行目のA/Iを削除します。\nよろしいでしょうか？","agenda_delete":"%{no}行目のアジェンダを削除します。\nよろしいでしょうか？"},"title":{"ai_registered":"A/I登録","ai_change":"A/I変更"}},"balloon_help":{"meeting_content":"議事録の内容(アジェンダ、A/I)が表示されます。アジェンダとA/Iを編集することができます。","add_ai":"アジェンダからA/Iにしたい文字を選択して、このボタンをクリックすることでA/Iを追加します。","add_agenda":"アジェンダを追加します。","set_title":"アジェンダからタイトルにしたい文字を選択して、このボタンをクリックすることでアジェンダのタイトル(太字)にします。","set_list":"アジェンダから箇条書きにしたい文字を選択して、このボタンをクリックすることで箇条書きにします。","delete_agenda":"アジェンダを削除します。アジェンダに紐づくA/Iがある場合は、削除できません。先にA/Iを削除して下さい。","change_ai":"A/Iを変更します。","delete_ai":"A/Iを削除します。","search_meeting":"会議を検索する画面を、別ウィンドウで表示します。","back":"前の画面に戻ります。(入力内容は自動保存されています。)","meeting_confirm":"会議の終了確認画面に移動します。(入力内容は自動保存されています。)"}},"show":{"title":"%{meeting_name}議事録 A/I対応","label":{"meeting-info":"会議情報","proceeding-content":"議事録内容","update_success":"更新が完了しました。"},"button":{"edit-complete":"編集完了","revert-complete":"差し戻し","complete":"完了","modify":"修正"},"js":{"alert":{"please_input_completion_date":"完了日を入力して下さい。"},"confirm":{"ai_completion_date_clear":"A/Iの完了日をクリアして未完了状態にします。\nよろしいでしょうか？"}},"balloon_help":{"comment":"コメントが表示されます。コメントを書き込んだり、書き込んだコメントを確認済みにすることができます。","write_comment":"コメントを入力した後、このボタンをクリックするかエンターキーでコメントを書き込みます。","confirm_comment":"コメントを確認済みにします。","meeting_content":"議事録の内容(アジェンダ、A/I)が表示されます。A/Iの完了日を入力することができます。","ai_complete_date":"A/Iの完了日を入力します。","ai_complete":"A/Iを完了にします。","ai_modify":"A/Iの完了日をクリアして、未完了状態にします。","edit_complete":"編集を完了します。","revert_complete":"議事録を会議開催中の状態に差し戻します。"}}},"cybozus":{"title":"サイボウズ連携情報","new":{"title":"サイボウズ連携情報"},"show":{"title":"サイボウズ連携情報","button":{"get_users":"ユーザ取得"},"message":{"get_users":"サイボウズからユーザを取得します。宜しいですか？"}},"edit":{"title":"サイボウズ連携情報"},"form":{"button":{"test_connect":"接続テスト"},"confirm":{"test_connect":"接続テストを行います。宜しいですか？"},"validate":{"error":"入力項目が正しくありません。確認して下さい。"}},"note":{"require":"「*」が付いている項目は必須入力です。","url":"サイボウズURLには使用しているサイボウズのログインページURLを入力して下さい。","login_id":"ログインIDはサイボウズにログインする際に使用するIDを入力して下さい。","password":"パスワードはサイボウズにログインする際に使用するパスワードを入力して下さい。","user_get":"サイボウズからユーザを取得する場合は、画面右下のユーザ取得ボタンをクリックして下さい。","user_password":"サイボウズから取得したユーザのパスワードは1234となります。","user_warning":"本システム上に作成されているユーザと、同じユーザIDを持つサイボウズユーザは取得できません。"},"get_users":{"success":"ユーザ取得が終了しました。\\nユーザ管理画面よりご確認下さい。"},"test_connect":{"success":"接続テストに成功しました。\\n接続情報を保存します。宜しいですか？"},"send_email":{"title":"サイボウズ/メール通知設定","enable":"チェック(サイボウズで通知)/チェック無し(メールで通知)"}},"unresolved_ai_lists":{"common":{"balloon_help":{"ai_content":"A/I内容を入力することで、一覧の内容を検索して表示します。","ai_stat_corresponding_date":"A/Iの対応予定日の開始日を入力することで、一覧の内容を検索して表示します。","ai_end_corresponding_date":"A/Iの対応予定日の終了日を入力することで、一覧の内容を検索して表示します。"}},"me":null,"meeting":null},"whats_new_lists":{"select":{"history_kind":{"all":"全て","meeting":"会議","action_item":"A/I","comment":"コメント"}},"label":{"seq":"項番","content":"内容","history_kind":"履歴種別","datetime":"日時"},"balloon_help":{"history_kind":"履歴種別を選択することで、一覧の内容を検索して表示します。"}},"users":{"title":"サイボウズ連携情報","index":{"title":"ユーザ一覧"},"new":{"title":"ユーザ作成"},"show":{"title":"ユーザ表示","button":{"get_users":"ユーザ取得"},"message":{"get_users":"サイボウズからユーザを取得します。宜しいですか？"}},"edit":{"title":"ユーザ編集"},"form":{"button":{"test_connect":"接続テスト"},"confirm":{"test_connect":"接続テストを行います。宜しいですか？"},"validate":{"error":"入力項目が正しくありません。確認して下さい。","message":{"cybozu":"サイボウズIDは半角数字のみ有効です。"}}},"shared":{"grant":{"admin":"管理者","normal":"一般"},"deleted":"○","firstlogged":"○"},"note":{"require":"「*」が付いている項目は必須入力です。","kana":"ふりがなを入力する場合は、必ずひらがなで入力して下さい。","mailaddress":"メールアドレスは@を含む正確なメールアドレスを入力して下さい。","password":"パスワードは半角英数字4～16文字で入力して下さい。","cybozu_id":"サイボウズIDはサイボウズとの連携で使用します。サイボウズIDが不明な場合は入力しないで下さい。"},"create":{"notice":"User was successfully created."},"update":{"notice":"User was successfully updated."},"destroy":{"notice":"User was successfully destroyed."}},"homes":{"index":{"balloon_help":{"free_word":"会議名を入力することで、一覧の内容を検索して表示します。","meeting_start_date":"会議の開催日の開始日を入力することで、一覧の内容を検索して表示します。","meeting_end_date":"会議の開催日の終了日を入力することで、一覧の内容を検索して表示します。","meeting_kind":"会議種別を選択することで、一覧の内容を検索して表示します。","clear":"検索条件をクリアします。","ai_me":"あなたの未解決A/Iが表示されます。\n行をクリックするとA/I対応画面に移動します。\nもっと見るをクリックすると一覧画面に移動します。","ai_meeting":"参加会議の未解決A/Iが表示されます。\n行をクリックするとA/I対応画面に移動します。\nもっと見るをクリックすると一覧画面に移動します。","scheduled_meeting":"開催予定または開催中の会議です。クリックすることで会議詳細画面に移動します。","meeting_new":"会議の登録を行います。","end_meeting":"終了した会議が表示されます。\n行をクリックすることでA/I対応画面に移動します。\nもっと見るをクリックすると一覧画面に移動します。","whats_new":"新着情報が表示されます。\n行をクリックすることで対象の画面に移動します。\nもっと見るをクリックすると一覧画面に移動します。","see_more":"一覧で表示します。","unresolved_me":"あなたの未解決A/Iです。クリックすることでA/I対応画面に移動します。","unresolved_meeting":"参加会議の未解決A/Iです。クリックすることでA/I対応画面に移動します。","ended_meeting":"終了会議です。クリックすることでA/I画面に移動します。","meeting_whats_new":"会議の新着情報です。クリックすることで会議詳細画面に移動します。","ended_meeting_whats_new":"会議の新着情報です。クリックすることでA/I対応画面に移動します。","comment_whats_new":"コメントの新着情報です。クリックすることでA/I対応画面に移動します。","ai_whats_new":"A/Iの新着情報です。クリックすることでA/I対応画面に移動します。"}}},"kinds":{"form":{"label":{"info":"会議情報","observer":"オブザーバー","participant":"参加者","agenda":"アジェンダ","seq":"項番","content":"設備/指摘"},"button":{"add":"追加","delete":"削除"}},"show":{"label":{"info":"会議情報","observer":"オブザーバー","participant":"参加者","agenda":"アジェンダ","seq":"項番","content":"設備/指摘"}},"destroy":{"notice":"Kind was successfully destroyed."}},"shared":{"message":{"admin_html":"Rock'n議事ロッカーを使用するには会議種別の登録が必須になります。\u003cbr/\u003e右上の管理設定ボタンより会議種別を登録して下さい。","normal_html":"Rock'n議事ロッカーを使用するには会議種別の登録が必須になります。\u003cbr/\u003e管理者に連絡して作成して下さい。"},"angularjs":{"datetime_format":"yyyy年MM月dd日 HH時mm分ss秒","date_format":"yyyy年MM月dd日","comment_datetime_format":"yyyy年MM月dd日 HH時mm分"}},"firstlogins":{"index":{"balloon_help":{"new_password":"新しいパスワードを入力します。","confirm_password":"確認用パスワードを入力します。","cancel":"キャンセルします。","registration":"パスワードを登録します。"}}},"accounts":{"form":{"label":{"account_setting":"アカウント設定"}},"index":{"title":"アカウント設定","button":{"edit":"設定変更"},"balloon_help":{"account_setting":"あなたのアカウント情報が表示されます。","change_setting":"設定を変更します。"}},"edit":{"title":"アカウント設定 変更","button":{"cancel":"キャンセル","update":"更新する"},"balloon_help":{"account_setting":"あなたのアカウント情報を入力します。","cancel":"キャンセルします。","update":"アカウント情報を更新します。"}},"update":{"notice":"User was successfully updated."}},"meetings":{"form":{"tooltip":{"kind":"関連情報を取得する。","related-meeting":"関連会議を検索する。","agenda-add":"アジェンダ追加","file-add":"資料追加"},"dialog":{"confirm":"キャンセルすると入力したデータは破棄されますが、宜しいですか？","kind":"会議種別に紐づく参加者、オブザーバー、アジェンダのデータを取得します。\\nデータを取得すると、現在入力している参加者、オブザーバー、\\nアジェンダが破棄されますが宜しいですか？"},"label":{"info":"会議情報","observer":"オブザーバー","participant":"参加者","agenda":"アジェンダ","seq":"項番","file-name":"ファイル名","annotation":"注釈","select_approver":"-- 承認者を選択 --","unregistered_guest":"未登録ユーザー"},"button":{"add":"追加","delete":"削除","refer":"会議参照","cancel":"キャンセル","update":"更新する","regist":"登録","search":"検索","add_unregistered":"未登録追加"},"file":{"message":{"warning":"PDF以外のファイルです。","error":"すでに同じ名前のファイルがあります。","delete":"アップロードファイルを削除します。宜しいですか？"}},"placeholder":{"annotation":"注釈を必ず入力して下さい。"},"validate":{"participant":"参加者を選択してください。"},"balloon_help":{"meeting_information":"会議情報を入力します。","meeting_name":"会議名を入力します。","meeting_kind":"会議種別を選択します。","meeting_scheduled_date":"会議の開催日を入力します。","meeting_start_scheduled_time":"会議の開始予定時刻を入力します。","meeting_room":"会議の開催場所を入力します。前回入力された開催場所を含む文字を入力すると、開催場所が自動提案されます。","meeting_scheduled_time":"会議の予定時間を選択します。","add_user":"右の一覧から選択したユーザーを追加します。","delete_user":"左の一覧から選択したユーザーを削除します。","search_user_name":"名前を入力することで、一覧を絞り込みます。","agenda":"アジェンダを入力します。","delete_agenda":"アジェンダを削除します。","file":"資料をアップロードします。","file_select":"ファイルを選択します。","file_annotation":"ファイルの注釈を入力します。","file_delete":"ファイルを削除します。","message_to_participant":"参加者へのメッセージを入力します。","search_meeting":"会議を検索する画面を、別ウィンドウで表示します。","cancel":"入力内容をキャンセルして、ホーム画面に戻ります。","registration":"入力内容を登録します。","add_unregistered_user":"未登録追加"}},"index":{"title":"会議一覧","button":{"clear":"クリア"},"canceled":"○","completed":"○","balloon_help":{"meeting":"クリックすることで、会議詳細画面に移動します。"}},"new":{"title":"会議登録"},"edit":{"title":"会議編集"},"show":{"title":"会議詳細","dialog":{"cancel_confirm":"会議を中止します。宜しいですか？","holding_confirm":"会議を開催します。宜しいですか？"},"button":{"cancel":"会議中止","edit":"会議編集","holding":"会議開催"},"balloon_help":{"meeting_information":"会議情報を表示します。","agenda":"アジェンダの内容を表示します。","file":"資料の内容を表示します。","message_to_participant":"参加者へのメッセージを表示します。","meeting_cancel":"会議を中止します。","meeting_edit":"会議を編集します。","meeting_start":"会議を開催します。"}}},"materials":{"message":{"files_that_exist":"既に存在するファイルです。"}},"logins":{"index":{"balloon_help":{"select_language":"表示する言語を選択します。","user_id":"ユーザIDを入力します。","password":"パスワードを入力します。","login":"ログインします。"}}}},"activerecord":{"models":{"meeting":"会議","cybozu":"サイボウズ","user":"ユーザー","observer":"オブザーバー","participant":"参加者","material":"資料","kind":"会議種別","action_item":"A/I","agenda":"アジェンダ"},"attributes":{"meeting":{"id":"ID","name":"会議名","related_meeting_id":"関連会議","kind_id":"会議種別","approver_id":"承認者","dates":"開催日","start_time":"開始予定時刻","scheduled_time":"予定時間","venue":"開催場所","message":"参加者へのメッセージ","is_holding":"開催中","is_canceled":"キャンセル","is_completed":"会議終了","created_at":"新規登録日","updated_at":"最終変更日"},"cybozu":{"url":"サイボウズURL","login_id":"ログインID","password_digest":"パスワード","created_at":"新規登録日","updated_at":"最終変更日"},"user":{"login_id":"ログインID","name":"名前","kana":"ふりがな","mailaddress":"メールアドレス","password_digest":"パスワード","cybozu_id":"サイボウズID","grant":"権限","is_deleted":"無効","is_firstlogged":"初回ログイン","created_at":"新規登録日","updated_at":"最終変更日"},"observer":{"user_id":"ユーザー","meeting_id":"会議","created_at":"新規登録日","updated_at":"最終変更日"},"participant":{"user_id":"ユーザー","meeting_id":"会議","created_at":"新規登録日","updated_at":"最終変更日"},"material":{"name":"ファイル名","annotation":"注釈","created_at":"新規登録日","updated_at":"最終変更日"},"kind":{"name":"会議種別名","is_deleted":"無効","created_at":"新規登録日","updated_at":"最終変更日"},"action_item":{"id":"ID","content":"A/I 内容","user_id":"担当者","scheduled_date":"対応予定日","completion_date":"完了日","created_at":"新規登録日","updated_at":"最終変更日"},"agenda":{"id":"ID","proceeding_id":"議事録ID","content":"設備/指摘","created_at":"新規登録日","updated_at":"最終変更日"}}}}};