/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

let data

async function fetchData() {
    const response = await fetch("https://jsonplaceholder.typicode.com/photos");
    data = await response.json();
    console.log(data)
    return data
}

const loadAllTheThings = async () => {
    await fetchData()
    const search = document.getElementById("search");
    const results = document.getElementById("results");
    let search_term = "";

    const showList = () => {
        results.innerHTML = "";
        data
            .filter((item) => {
                return (
                    item.title.toLowerCase().includes(search_term) ||
                    item.url.toLowerCase().includes(search_term)
                );
            })
            .forEach((e) => {
                const li = document.createElement("li");
                li.innerHTML = `<div><img src="${e.thumbnailUrl}"/> <br/> <span>${e.title}</span></div>`;
                results.appendChild(li);
            });
    };

    showList();

    search.addEventListener("input", (event) => {
        search_term = event.target.value.toLowerCase();
        showList();
    });
}
// fetchData()
loadAllTheThings()





