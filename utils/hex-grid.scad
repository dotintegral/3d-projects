calculateTriangleHeight = function (a) a * sqrt(3) / 2;

module hexShape (h, r) {
    translate(v = [calculateTriangleHeight(r),r,0]) 
    rotate([0,0,90])
    cylinder(h = h, r = r, $fn=6);
}

module hexGrid(rows, columns, radius, height, spacing) {
    triangleHeight = calculateTriangleHeight(radius);

    for (row = [0:rows-1]) {
        yOffset = (1.5 * radius + spacing) * row;
        rowXOffset = row % 2 == 0 ? 0 : (triangleHeight + 0.5 * spacing);

        columnsInRow = row % 2 == 0 ? columns : columns - 1;

        for (col = [0 : columnsInRow-1]) {
            xOffset = (2 * triangleHeight + spacing ) * col + rowXOffset;
            translate(v = [xOffset, yOffset, 0]) 
            hexShape(h=height, r=radius);
        }
    }
}

hexGrid(rows = 5, columns = 5, height = 2, radius = 5, spacing = 1);