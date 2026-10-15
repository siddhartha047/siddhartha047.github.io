(() => {
  const toggle = document.querySelector('.nav-toggle');
  const navigation = document.querySelector('.site-nav');
  if (toggle && navigation) {
    toggle.hidden = false;
    navigation.classList.add('enhanced');
    toggle.addEventListener('click', () => {
      const expanded = toggle.getAttribute('aria-expanded') === 'true';
      toggle.setAttribute('aria-expanded', String(!expanded));
      navigation.classList.toggle('is-open', !expanded);
    });
    document.addEventListener('keydown', event => {
      if (event.key === 'Escape' && toggle.getAttribute('aria-expanded') === 'true') {
        toggle.setAttribute('aria-expanded', 'false');
        navigation.classList.remove('is-open');
        toggle.focus();
      }
    });
  }
  const tools = document.querySelector('.publication-tools');
  if (!tools) return;
  const search = document.querySelector('#publication-search');
  const buttons = [...document.querySelectorAll('[data-filter]')];
  const papers = [...document.querySelectorAll('.pub')];
  const years = [...document.querySelectorAll('.publication-year')];
  const count = document.querySelector('.result-count');
  const empty = document.querySelector('.empty-results');
  let filter = 'all';
  const update = () => {
    const terms = search.value.toLocaleLowerCase().trim().split(/\s+/).filter(Boolean);
    let visible = 0;
    papers.forEach(paper => {
      const matches = (filter === 'all' || filter.split(',').includes(paper.dataset.category)) && terms.every(term => paper.dataset.search.toLocaleLowerCase().includes(term));
      paper.hidden = !matches;
      if (matches) visible++;
    });
    years.forEach(year => { year.hidden = ![...year.querySelectorAll('.pub')].some(paper => !paper.hidden); });
    count.textContent = `${visible} ${visible === 1 ? 'work' : 'works'}`;
    empty.hidden = visible > 0;
  };
  buttons.forEach(button => button.addEventListener('click', () => {
    filter = button.dataset.filter;
    buttons.forEach(item => {
      const active = item === button;
      item.classList.toggle('active', active);
      item.setAttribute('aria-pressed', String(active));
    });
    update();
  }));
  search.addEventListener('input', update);
  tools.hidden = false;
  count.hidden = false;
  update();
})();
