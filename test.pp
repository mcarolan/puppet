$username = "martin"

exec {'download wallpaper':
	command => "wget https://raw.github.com/mcarolan/puppet/master/wallpaper.jpg -O /home/${username}/wallpaper.jpg",
	path => '/usr/local/bin:/bin:/usr/bin'
}

exec {'set wallpaper':
	command => "gsettings set org.gnome.desktop.background picture-uri file:///home/${username}/wallpaper.jpg",
	path =>  '/usr/local/bin:/bin:/usr/bin',
	require => Exec['download wallpaper']
}

file { '/usr/share/applications/ubuntuone-installer.desktop':
	ensure => absent
}

file { '/usr/share/applications/ubuntu-amazon-default.desktop':
	ensure => absent
}

package { 'unity-lens-shopping':
	ensure => absent
}

package { 'unity-scope-video-remote':
	ensure => absent
}

package { 'unity-scope-musicstores':
	ensure => absent
}

exec {'set unity favourites': 
	command => "gsettings set com.canonical.Unity.Launcher favorites \"['application://ubiquity.desktop', 'application://nautilus.desktop', 'application://firefox.desktop', 'application://gnome-terminal.desktop', 'application://ubuntu-software-center.desktop', 'application://gnome-control-center.desktop', 'unity://running-apps', 'unity://expo-icon', 'unity://devices']\"",
	path =>  '/usr/local/bin:/bin:/usr/bin'
}

exec {'disable some unity lenses': 
	command => "gsettings set com.canonical.Unity.Lenses disabled-scopes \"['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']\"",
	path =>  '/usr/local/bin:/bin:/usr/bin'
}

