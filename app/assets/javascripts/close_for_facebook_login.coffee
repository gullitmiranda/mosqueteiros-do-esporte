if window.opener? and window.opener.location.hostname == window.location.hostname
  # window.opener.location.replace(window.location.href)
  window.opener.location.reload(true)
  window.close()
