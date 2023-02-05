del .hashlist.txt
for %%F in (*) do (certutil -hashfile "%%F" SHA256 | find /v "hashfile command completed successfully" >>.hashlist.txt& echo "%%F")
