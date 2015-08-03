;; replace replace-words-region
(defun replace-template (start end)
  "Replace “x” to “y” in current region."
  (interactive "r")
  (save-restriction
    (narrow-to-region start end)
    (goto-char (point-min))
    (while (search-forward "@m1" nil t) (replace-match "●●さん、

お疲れ様です。織田です。

返信が遅れ申し訳ありません。

●/●(●)のライブにお誘い頂きありがとうございます。

１．
その日のライブに私たちも出演させて頂けますと幸いです。

当日もよろしくお願い致します。

２．
バンドメンバーに確認したところ、その日は既に予定が
入っており、今回の出演は見送らせてください。

また、次の機会に、お誘い頂けたら幸いです。

Notebooks
織田" nil t))
    
    )
  )
