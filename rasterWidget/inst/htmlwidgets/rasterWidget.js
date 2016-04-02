HTMLWidgets.widget({

  name: 'rasterWidget',
  type: 'output',
  initialize: function(el, width, height) {
    return {
      // TODO: add instance fields as required
    }
  },

  renderValue: function(el, x, instance) {
    
    var dat = x.values;
    var classBreaks = x.classBreaks;
    var colors = x.colors;
    
    var z = 20,
        w = 80 * z,
        h = 115 * z,
        canvasX = x.width,
        canvasY = x.height,
        x = w / z,
        y = h / z;
    
    var svg = d3.select("#htmlwidget_container")
        .select("div")
        .append("svg")
        .style("border", "1px solid black")
        .attr("width", canvasX)
        .attr("height", canvasY)
        .call(d3.behavior.zoom().on("zoom", zoom))
        .append("g");
    
    svg.selectAll("rect")
        .data(d3.range(dat.length))
        .enter().append("rect")
        .attr("transform", translate)
        .attr("width", z)
        .attr("height", z)
        .style("fill", colorize)
        .append("svg:title")
        .text(getCellValue);
    
    function translate(d) {
        return "translate(" + (d % x) * z + "," + Math.floor(d / x) * z + ")";
    }
    
    function zoom() {
        svg.attr("transform", "translate(" + d3.event.translate + ")" + "scale(" + d3.event.scale + ")");
    }
    
    function colorize(d) {
      var amountClassBreaks = classBreaks.length;
      for (var i = 0; i < amountClassBreaks; i++) {
        if (dat[d] < classBreaks[i])
          return colors[i]
      }
 /*     
        console.log(dat[d]);
        if(dat[d] === null)
            return "white";
        if(dat[d] < 548)
            return "yellow";
        if(dat[d] < 968)
            return "orange";
        else
            return "red";
*/
    }
    
    function getCellValue(d) { 
      return dat[d];
    }
  },
  
  resize: function(el, width, height, instance) {
  }
});
