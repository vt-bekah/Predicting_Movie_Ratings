document.addEventListener('DOMContentLoaded', function () {
    // Fetch data from the CSV file
    fetch('main_data.csv')
        .then(response => response.text())
        .then(csvData => {

            var films = parseCsvData(csvData);
            console.log('Parsed Movies:', films);


            new autoComplete({
                data: {
                    src: films,
                },
                selector: "#autoComplete",
                threshold: 2,
                debounce: 100,
                searchEngine: "strict",
                resultsList: {
                    render: true,
                    container: source => {
                        source.setAttribute("id", "movie_title");
                    },
                    destination: document.querySelector("#autoComplete"),
                    position: "afterend",
                    element: "ul"
                },
                maxResults: 15,
                highlight: true,
                resultItem: {
                    content: (data, source) => {
                        source.innerHTML = data.match;
                    },
                    element: "li"
                },
                noResults: () => {
                    const result = document.createElement("li");
                    result.setAttribute("class", "no_result");
                    result.setAttribute("tabindex", "1");
                    result.innerHTML = "No Results";
                    // document.querySelector("#autoComplete_list").appendChild(result);
                },
                onSelection: feedback => {
                    document.querySelector('#autoComplete').value = feedback.selection.value;
                }
                
            });
        })
        .catch(error => console.error('Error fetching data:', error));
});

function parseCsvData(csvData) {
    const lines = csvData.split('\n');
    const movies = [];


    const headers = lines[0].split(',');

    for (let i = 1; i < lines.length; i++) {
        const columns = lines[i].split(',');

        if (columns.length > 1) {
            const movieTitleIndex = headers.indexOf('movie_title');


            if (columns.length > movieTitleIndex && columns[movieTitleIndex] !== undefined) {
                movies.push(columns[movieTitleIndex].trim());
            }
        }
    }

    return movies;
}