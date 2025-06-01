const listEndpoints = document.querySelector('.list-endpoints');
const searchInput = document.querySelector('input[type="search"]');
let allEndpoints = [];

document.addEventListener('DOMContentLoaded', function () {
  fetch('/api/list_endpoints')
    .then(res => res.json())
    .then(data => {
      allEndpoints = data;
      renderEndpoints(allEndpoints);
    })
    .catch(error => console.error('Error fetching data:', error));
});

function handleLink(event) {
  const links = document.querySelectorAll('a');
  links.forEach(elem => elem.classList.remove('active'));
  event.target.classList.add('active');
}

function renderEndpoints(data) {
  listEndpoints.innerHTML = '';

  data
    .filter(elem => {
      return elem.methods[0] === 'GET' &&
        (elem.middlewares[0] === 'all' || elem.middlewares[0] === 'latest');
    })
    .forEach((elem, index) => {
      const text = `
        <a
          href="${elem.path}"
          target="_blank" 
          onclick="handleLink(event)"
          class="${index === 0 ? 'active' : ''}"
        >
            <span>${elem.methods[0]}</span>${elem.path}
        </a>
      `;
      listEndpoints.innerHTML += text;
    });
}

searchInput.addEventListener('input', function () {
  const query = this.value.toLowerCase();
  const filtered = allEndpoints.filter(elem =>
    elem.path.toLowerCase().includes(query) &&
    elem.methods[0] === 'GET' &&
    (elem.middlewares[0] === 'all' || elem.middlewares[0] === 'latest')
  );
  renderEndpoints(filtered);
});