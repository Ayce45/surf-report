const lat = 47.519124;
const lng = -2.856659;
const params =
  "waveHeight,swellDirection,windSpeed,windDirection,airTemperature,cloudCover,humidity,precipitation";
const start = new Date(new Date().setHours(0, 0, 0, 0)).toISOString();
const end = new Date(new Date().setHours(23, 59, 59, 999)).toISOString();
const now = new Date().toISOString();
const token =
  "6db0f846-9ab7-11ea-a27e-0242ac130002-6db0f8fa-9ab7-11ea-a27e-0242ac130002";

let weatherReady = false;
let tideSeaReady = false;
let tideExtremesReady = false;
let astronomyReady = false;

Array.prototype.max = function () {
  return Math.max.apply(null, this);
};

Array.prototype.min = function () {
  return Math.min.apply(null, this);
};

Array.prototype.avg = function () {
  return this.reduce((a, b) => new Number(a) + new Number(b)) / this.length;
};

function isEmpty(obj) {
  for (var prop in obj) {
    if (obj.hasOwnProperty(prop)) return false;
  }
  return true;
}

function fetchReady() {
  return weatherReady && tideSeaReady && tideExtremesReady && astronomyReady;
}

function degToCompass(num) {
  let val = Math.floor(num / 22.5 + 0.5),
    dirs = [
      "N",
      "NNE",
      "NE",
      "ENE",
      "E",
      "ESE",
      "SE",
      "SSE",
      "S",
      "SSW",
      "SW",
      "WSW",
      "W",
      "WNW",
      "NW",
      "NNW",
    ];
  return dirs[val % 16];
}
document.addEventListener("DOMContentLoaded", function () {
  fetch(
    "api/getWeather.php?data_timestamp=" + start.slice(0, 19).replace("T", " ")
  )
    .then((response) => response.json())
    .then((jsonData) => {
      if (isEmpty(jsonData)) {
        fetch(
          `https://api.stormglass.io/v2/weather/point?lat=${lat}&lng=${lng}&params=${params}&start=${start}&end=${end}`,
          {
            headers: {
              Authorization: token,
            },
          }
        )
          .then((response) => response.json())
          .then((jsonData) => {
            loadWeather(jsonData);
            fetch(
              "api/setWeather.php?data_timestamp=" +
                start.slice(0, 19).replace("T", " "),
              {
                method: "POST",
                body: JSON.stringify(jsonData),
              }
            );
          });
      } else {
        loadWeather(jsonData);
      }
    });

  fetch(
    "api/getTideSea.php?data_timestamp=" + start.slice(0, 19).replace("T", " ")
  )
    .then((response) => response.json())
    .then((jsonData) => {
      if (isEmpty(jsonData)) {
        fetch(
          `https://api.stormglass.io/v2/tide/sea-level/point?lat=${lat}&lng=${lng}&start=${start}&end=${end}`,
          {
            headers: {
              Authorization: token,
            },
          }
        )
          .then((response) => response.json())
          .then((jsonData) => {
            loadTideSea(jsonData);
            fetch(
              "api/setTideSea.php?data_timestamp=" +
                start.slice(0, 19).replace("T", " "),
              {
                method: "POST",
                body: JSON.stringify(jsonData),
              }
            );
          });
      } else {
        loadTideSea(jsonData);
      }
    });

  fetch(
    "api/getTideExtremes.php?data_timestamp=" +
      start.slice(0, 19).replace("T", " ")
  )
    .then((response) => response.json())
    .then((jsonData) => {
      if (isEmpty(jsonData)) {
        fetch(
          `https://api.stormglass.io/v2/tide/extremes/point?lat=${lat}&lng=${lng}&start=${start}&end=${end}`,
          {
            headers: {
              Authorization: token,
            },
          }
        )
          .then((response) => response.json())
          .then((jsonData) => {
            loadTideExtreme(jsonData);
            fetch(
              "api/setTideExtremes.php?data_timestamp=" +
                start.slice(0, 19).replace("T", " "),
              {
                method: "POST",
                body: JSON.stringify(jsonData),
              }
            );
          });
      } else {
        loadTideExtreme(jsonData);
      }
    });

  fetch(
    "api/getAstronomy.php?data_timestamp=" +
      start.slice(0, 19).replace("T", " ")
  )
    .then((response) => response.json())
    .then((jsonData) => {
      if (isEmpty(jsonData)) {
        fetch(
          `https://api.stormglass.io/v2/astronomy/point?lat=${lat}&lng=${lng}&end=${end}`,
          {
            headers: {
              Authorization: token,
            },
          }
        )
          .then((response) => response.json())
          .then((jsonData) => {
            loadAstronomy(jsonData);
            fetch(
              "api/setAstronomy.php?data_timestamp=" +
                start.slice(0, 19).replace("T", " "),
              {
                method: "POST",
                body: JSON.stringify(jsonData),
              }
            );
          });
      } else {
        loadAstronomy(jsonData);
      }
    });

  function loadWeather(weather) {
    let waveHeights = [];
    const $waveHeight = document.querySelector("#waveHeight");

    let waveHeightTimes = [];
    const $waveHeightTime = document.querySelector("#waveHeightTimes");

    let windSpeedTimes = [];
    const $windSpeedTime = document.querySelector("#windSpeedTime");

    let swellDirections = [];
    const $swellDirection = document.querySelector("#swellDirection");

    let windSpeeds = [];
    const $windSpeed = document.querySelector("#windSpeed");

    let windDirections = [];
    const $windDirection = document.querySelector("#windDirection");

    let airTemperatures = [];
    const $airTemperature = document.querySelector("#airTemperature");

    let cloudCovers = [];
    const $cloudCover = document.querySelector("#cloudCover");

    let humiditys = [];
    const $humidity = document.querySelector("#humidity");

    let windTimes = [];

    let TemperatureTimes = [];

    let precipitations = [];
    const $precipitation = document.querySelector("#precipitation");

    /** HAUTEUR DES VAGUES */
    weather.hours.forEach(function (element) {
      let waveHeight = 0;
      let i = 0;
      for (const [key, value] of Object.entries(element.waveHeight)) {
        waveHeight += value;
        i++;
      }
      waveHeights.push((waveHeight / i).toFixed(2));
      waveHeightTimes.push({
        height: (waveHeight / i).toFixed(2),
        time: element.time,
      });
    });
    waveHeightTimes = waveHeightTimes.filter(function (element) {
      if (element.height == waveHeights.min()) {
        element.type = "low";
        return element;
      } else if (element.height == waveHeights.max()) {
        element.type = "high";
        return element;
      }
    });

    waveHeightTimes.forEach(function (element) {
      $waveHeightTime.innerHTML += `<li>
                                        <div>${element.height}m<span>${
        element.type == "high" ? "Haute" : "Basse"
      }</span><span>${new Date(element.time).toLocaleTimeString([], {
        hour: "2-digit",
        minute: "2-digit",
      })}</span></div>
                                    </li>`;
    });

    $waveHeight.innerHTML =
      waveHeights.min() + " - " + waveHeights.max() + "<span>m</span>";

    /** DIRECTION DE LA HOULE */
    weather.hours.forEach(function (element) {
      let swellDirection = 0;
      let i = 0;
      for (const [key, value] of Object.entries(element.swellDirection)) {
        swellDirection += value;
        i++;
      }
      swellDirections.push((swellDirection / i).toFixed(2));
    });
    $swellDirection.innerHTML = degToCompass(swellDirections.avg().toFixed(2));

    /** DIRECTION VITESSE VENT */
    weather.hours.forEach(function (element) {
      let windDirection = 0;
      let windSpeed = 0;
      let i = 0;
      for (const [key, value] of Object.entries(element.windDirection)) {
        windDirection += value;
        i++;
      }
      for (const [key, value] of Object.entries(element.windSpeed)) {
        windSpeed += value;
      }
      windDirections.push((windDirection / i).toFixed(2));
      windSpeeds.push(((windSpeed / i) * 1.944).toFixed(2));
      windSpeedTimes.push({
        direction: (windDirection / i).toFixed(2),
        speed: ((windSpeed / i) * 1.944).toFixed(2),
        time: element.time,
      });
    });
    $windSpeed.innerHTML = `${windSpeeds.avg().toFixed(0)}<span>kt</span>`;
    $windDirection.innerHTML = degToCompass(windDirections.avg());

    /** PREVISION VENT */
    let windSpeedTimesFiltered = windSpeedTimes.filter(function (element) {
      if (element.speed == windSpeeds.min()) {
        element.type = "low";
        return element;
      } else if (element.speed == windSpeeds.max()) {
        element.type = "high";
        return element;
      }
    });

    windSpeedTimesFiltered.forEach(function (element) {
      $windSpeedTime.innerHTML += `<li>
                                        <div>${
                                          element.speed
                                        }kt<span>${degToCompass(
        element.direction
      )}</span><span>${
        element.type == "high" ? "Haute" : "Basse"
      }</span><span>${new Date(element.time).toLocaleTimeString([], {
        hour: "2-digit",
        minute: "2-digit",
      })}</span></div>
                                    </li>`;
    });

    windTimes = windSpeedTimes.map(function (element) {
      return new Date(element.time).toLocaleTimeString([], {
        hour: "2-digit",
        minute: "2-digit",
      });
    });

    var ctx = document.getElementById("windPrevision").getContext("2d");
    var windPrevision = new Chart(ctx, {
      type: "bar",
      data: {
        labels: windTimes,
        datasets: [
          {
            label: "Vitesse",
            data: windSpeeds,
            backgroundColor: "#5e72e4",
            order: 2,
          },
          {
            label: "Vitesse moyenne",
            data: windSpeeds,
            type: "line",
            order: 1,
            borderColor: "#5e72e4",
          },
        ],
      },
      options: {
        legend: {
          labels: {
            fontColor: "white",
          },
        },
        scales: {
          yAxes: [
            {
              ticks: {
                fontColor: "white",
              },
            },
          ],
          xAxes: [
            {
              ticks: {
                fontColor: "white",
              },
            },
          ],
        },
      },
    });

    /** TEMPERATURE */
    weather.hours.forEach(function (element) {
      let airTemperature = 0;
      let i = 0;
      for (const [key, value] of Object.entries(element.airTemperature)) {
        airTemperature += value;
        i++;
      }
      airTemperatures.push((airTemperature / i).toFixed(0));
      TemperatureTimes.push(
        new Date(element.time).toLocaleTimeString([], {
          hour: "2-digit",
          minute: "2-digit",
        })
      );
    });
    $airTemperature.innerHTML =
      airTemperatures.min().toFixed(0) +
      " - " +
      airTemperatures.max().toFixed(0) +
      "°";

    var ctx = document.getElementById("TemperaturePrevision").getContext("2d");
    var TemperaturePrevision = new Chart(ctx, {
      type: "line",
      data: {
        labels: TemperatureTimes,
        datasets: [
          {
            label: "Temperature",
            data: airTemperatures,
            borderColor: "#5e72e4",
            order: 2,
          },
        ],
      },
      options: {
        legend: {
          labels: {
            fontColor: "white",
          },
        },
        scales: {
          yAxes: [
            {
              ticks: {
                fontColor: "white",
                stepSize: 1,
                beginAtZero: true,
              },
            },
          ],
          xAxes: [
            {
              ticks: {
                fontColor: "white",
              },
            },
          ],
        },
      },
    });

    /** COUVERTURE NUAGEUSE */
    weather.hours.forEach(function (element) {
      let cloudCover = 0;
      let i = 0;
      for (const [key, value] of Object.entries(element.cloudCover)) {
        cloudCover += value;
        i++;
      }
      cloudCovers.push((cloudCover / i).toFixed(2));
    });
    $cloudCover.innerHTML = cloudCovers.avg().toFixed(0) + "%";

    /** HUMIDITÉ */
    weather.hours.forEach(function (element) {
      let humidity = 0;
      let i = 0;
      for (const [key, value] of Object.entries(element.humidity)) {
        humidity += value;
        i++;
      }
      humiditys.push((humidity / i).toFixed(2));
    });
    $humidity.innerHTML = humiditys.avg().toFixed(0) + "%";

    /** PRÉCIPITATION */
    weather.hours.forEach(function (element) {
      let precipitation = 0;
      let i = 0;
      for (const [key, value] of Object.entries(element.precipitation)) {
        precipitation += value;
        i++;
      }
      precipitations.push((precipitation / i).toFixed(2));
    });
    $precipitation.innerHTML = precipitations.avg().toFixed(0) + "kg/m²";

    weatherReady = true;
  }

  function loadAstronomy(astronomy) {
    const $astronomy = document.querySelector("#astronomy");

    /** COUCHER DU SOLEIL */
    $astronomy.innerHTML = `${new Date(
      astronomy.data[0].sunrise
    ).toLocaleTimeString([], {
      hour: "2-digit",
      minute: "2-digit",
    })} - ${new Date(astronomy.data[0].sunset).toLocaleTimeString([], {
      hour: "2-digit",
      minute: "2-digit",
    })}`;
    astronomyReady = true;
  }

  function loadTideExtreme(tideExtremes) {
    const $tideExtreme = document.querySelector("#tideExtreme");

    /** MARÉE EXTREME*/
    tideExtremes.data.forEach(function (element) {
      $tideExtreme.innerHTML += `<li>
                                        <div>${element.height.toFixed(
                                          2
                                        )}m<span>${
        element.type == "high" ? "Haute" : "Basse"
      }</span><span>${new Date(element.time).toLocaleTimeString([], {
        hour: "2-digit",
        minute: "2-digit",
      })}</span></div>
                                    </li>`;
    });
    tideExtremesReady = true;
  }

  function loadTideSea(tideSea) {
    let tideHeights = [];
    let tideTimes = [];

    tideSea.data.forEach(function (element) {
      tideHeights.push(element.sg.toFixed(2));
    });

    tideSea.data.forEach(function (element) {
      tideTimes.push(
        new Date(element.time).toLocaleTimeString([], {
          hour: "2-digit",
          minute: "2-digit",
        })
      );
    });

    var ctx = document.getElementById("tidePrevision").getContext("2d");
    var tidePrevision = new Chart(ctx, {
      type: "bar",
      data: {
        labels: tideTimes,
        datasets: [
          {
            label: "Hauteur",
            data: tideHeights,
            backgroundColor: "#5e72e4",
            order: 2,
          },
          {
            label: "Hauteur moyen",
            data: tideHeights,
            type: "line",
            order: 1,
            borderColor: "#5e72e4",
          },
        ],
      },
      options: {
        legend: {
          labels: {
            fontColor: "white",
          },
        },
        scales: {
          yAxes: [
            {
              ticks: {
                fontColor: "white",
              },
            },
          ],
          xAxes: [
            {
              ticks: {
                fontColor: "white",
              },
            },
          ],
        },
      },
    });
    tideSeaReady = true;
  }
});

document.addEventListener("DOMContentLoaded", function () {
  const timedata = new Date().toLocaleString();
  const $timedata = document.querySelector("#timedata");

  const $report = document.querySelector("#report");
  /** DATE DES DONNÉES */
  $timedata.innerHTML = timedata;

  /** ANIMATION DE CHARGEMENT DE PAGE */
  document.onreadystatechange = function () {
    var interval = setInterval(() => {
      if (document.readyState == "complete" && fetchReady()) {
        $report.classList.add("is-active");
        clearInterval(interval);
      }
    }, 20);
  };
});
