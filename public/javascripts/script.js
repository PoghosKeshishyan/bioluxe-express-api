document.addEventListener('DOMContentLoaded', function () {
    const listEndpoints = document.querySelector('.list-endpoints');

    fetch('/api/list_endpoints')
        .then(res => res.json())
        .then(data => renderEndpoints(data))
        .catch(error => console.error('Error fetching data:', error));

    function renderEndpoints(data) {
        data
            .filter(elem => elem.methods[0] === 'GET' && elem.middlewares[0] === 'all' || elem.middlewares[0] === 'latest')
            .forEach(elem => {
                const text = `
                    <a href="${elem.path}" target="_blank">
                        <span>${elem.methods[0]}</span>   ${elem.path}
                    </a>
                `;

                listEndpoints.innerHTML += text;
            });
    }
});