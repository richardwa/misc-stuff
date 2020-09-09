 (() => {
  const toggle = tip => ({ key }) =>
    key === 'Control' && document.querySelectorAll(`[data-tooltip*='${tip}']`).click();
  document.body.onkeyup = toggle('Turn off microphone');
  document.body.onkeydown = toggle('Turn on microphone');
})();
