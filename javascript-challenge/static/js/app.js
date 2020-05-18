
// from data.js
var tableData = data;

// select the button 
var filterButton = d3.select("#filter-btn");

// create event handlers
filterButton.on("click", runEnter);

tabulate(data, ['datetime', 'city', 'state', 'country', 'shape', 'durationMinutes', 'comments']);

function tabulate(data,columns) {
    var filteredData=data;
    var table = d3.select("#ufo-table");

    // create rows 
    var rows = table.select("tbody").selectAll("tr")
        .data(filteredData).enter().append('tr');
    console.log(table.select('tbody').selectAll('tr'));
    // create cells
    var cells = rows.selectAll('td')
        .data( row => {
            return columns.map( column => {
                return {column: column, value: row[column]};
            });
        })
        .enter()
        .append('td')
        .text(d => d.value);
};

// complete the event handler function for the form 
function runEnter() {
    // prevent the page from refreshing 
    d3.event.preventDefault();

    // select the input element and get the raw HTML node
    var inputElement = d3.select("#datetime")

    // get the value property of the input element 
    var inputValue = inputElement.property("value");

    console.log(tableData);
    console.log(inputValue);

    //filter data based on user input datetime
    var filteredData = tableData.filter(sighting => sighting.datetime === inputValue);

    console.log(filteredData);

    //clear table rows 
    d3.select('#ufo-table').select('tbody').selectAll("tr").remove();


    //render the table 
    tabulate(filteredData, ['datetime', 'city', 'state', 'country', 'shape', 'durationMinutes', 'comments']);
};