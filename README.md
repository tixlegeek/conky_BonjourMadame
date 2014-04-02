conky_BonjourMadame
===================

A BASH script to insert the last bonjourMadame pic in a conky agent.

This code downloads the last pic from bonjourmadame.fr, stores it in a
directory, crop and resize it, and archives it.

You need to launch this script in your conkyrc, using ${texeci 60 ./bonjourmadame }
and then insert it in the conkyrc, using ${image imgPath -p x,y -f t }

You can find more about this script on my blog:

http://tixlegeek.com/?2013/08/05/361--shellscript-la-derniere-bonjour-madame-dans-conky
