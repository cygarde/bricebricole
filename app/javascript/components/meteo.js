const meteo = () => {
  const apikey = '9126c55318ce8f47eef482e881e6846e';

  const ville = document.getElementById("ville").innerHTML;
  console.log(ville);
  fetch(`https://api.openweathermap.org/data/2.5/weather?q=${ville}&appid=${apikey}&units=metric&lang=fr`)
    .then(response => response.json())
    .then((data) => {
      console.log(data);
      const main = data.weather[0].main;
      const description = data.weather[0].description;
      const icon = data.weather[0].icon;
      const temp = data.main.temp;

      const result = document.getElementById("meteo");

      result.innerText = `${description} ${temp}`;

      const meteoImg = document.querySelector(".img-meteo");
        meteoImg.setAttribute("src",`http://openweathermap.org/img/wn/${icon}@2x.png`);
    });
};

export { meteo };
