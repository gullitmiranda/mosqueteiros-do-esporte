if window.opener? and window.opener.location.hostname == window.location.hostname
  window.opener.location.replace(window.location.href)
  window.close()
