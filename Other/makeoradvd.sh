mkisofs -o Oracle9i_x86Linux-dvd.iso \
        -l -r -J -m TRANS.TBL \
        -V "Oracle 9i Linux x86 DVD" \
        -hide-joliet-trans-tbl \
        -hide-rr-moved \
        -allow-leading-dots \
.
