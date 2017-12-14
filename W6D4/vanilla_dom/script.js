document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!

  const submit = document.querySelector(".favorite-submit");

  const submitLi = (e) => {
    e.preventDefault();

    const inputEl = document.querySelector(".favorite-input");
    const favorite = inputEl.value;
    inputEl.value = "";

    const ul = document.getElementById("sf-places");
    const li = document.createElement("li");
    li.textContent = favorite;
    ul.appendChild(li);
  };

  submit.addEventListener("click", submitLi);


  // adding new photos

  // --- your code here!

  const show = document.querySelector(".photo-show-button");
  const submit = document.querySelector(".photo-url-submit");

  const toggleForm = (e) => {
    const form = document.querySelector(".photo-form-container");
    if (form.className === "photo-form-container") {
      form.className = "photo-form-container hidden";
    } else {
      form.className = "photo-form-container";
    }
  };

  const submitPhoto = (e) => {
    e.preventDefault();

    const inputURL = document.querySelector(".photo-url-input");
    const photoUrl = inputURL.value;
    inputURL.value = "";

    const img = document.createElement("img");
    img.src = photoUrl;

    const li = document.createElement("li");
    li.appendChild(img);

    const ul = document.querySelector(".dog-photos");
    ul.appendChild(li);
  };

  show.addEventListener("click", toggleForm);
  submit.addEventListener("click", submitPhoto);

});
