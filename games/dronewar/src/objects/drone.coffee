class @Drone extends Circle
  constructor: (@config = {}) ->
    super
    @image.remove()
    @image = @g.append("image")
      .attr("xlink:href", GameAssetsUrl + "drone_1.png")
      .attr("x", -@size).attr("y", -@size)
      .attr("width", @size * 2)
      .attr("height", @size * 2)
        
  death: ->
    @deactivate()
    dur = 100
    N = 320
    fill = "hsl(" + Math.random() * N + ", 50%, 70%)"
    @g.append("circle")
      .attr("r", @size)
      .attr("x", 0)
      .attr("y", 0)
      .transition()
      .duration(dur)
      .ease('sqrt')
      .attr("fill", fill)
      .remove()
    @g.attr("class", "")
      .transition()
      .delay(dur)
      .duration(dur * 2)
      .ease('sqrt')
      .style("opacity", "0")
      .remove()