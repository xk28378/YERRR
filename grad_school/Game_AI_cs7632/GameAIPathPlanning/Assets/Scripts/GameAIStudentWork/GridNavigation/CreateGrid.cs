// Remove the line above if you are subitting to GradeScope for a grade. But leave it if you only want to check
// that your code compiles and the autograder can access your public methods.

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace GameAICourse
{

    public class CreateGrid
    {

        // Please change this string to your name
        public const string StudentAuthorName = "Nehmya Negash";


        // Helper method provided to help you implement this file. Leave as is.
        // Returns true if point p is inside (or on edge) the polygon defined by pts (CCW winding). False, otherwise
        static bool IsPointInsidePolygon(Vector2Int[] pts, Vector2Int p)
        {
            return CG.InPoly1(pts, p) != CG.PointPolygonIntersectionType.Outside;
        }


        // Helper method provided to help you implement this file. Leave as is.
        // Returns float converted to int according to default scaling factor (1000)
        static int Convert(float v)
        {
            return CG.Convert(v);
        }

        // Helper method provided to help you implement this file. Leave as is.
        // Returns Vector2 converted to Vector2Int according to default scaling factor (1000)
        static Vector2Int Convert(Vector2 v)
        {
            return CG.Convert(v);
        }

        // Helper method provided to help you implement this file. Leave as is.
        // Returns true is segment AB intersects CD properly or improperly
        static bool Intersects(Vector2Int a, Vector2Int b, Vector2Int c, Vector2Int d)
        {
            return CG.Intersect(a, b, c, d);
        }


        // IsPointInsideBoundingBox(): Determines whether a point (Vector2Int:p) is On/Inside a bounding box (such as a grid cell) defined by
        // minCellBounds and maxCellBounds (both Vector2Int's).
        // Returns true if the point is ON/INSIDE the cell and false otherwise
        // This method should return true if the point p is on one of the edges of the cell.
        // This is more efficient than PointInsidePolygon() for an equivalent dimension poly
        // Preconditions: minCellBounds <= maxCellBounds, per dimension
        static bool IsPointInsideAxisAlignedBoundingBox(Vector2Int minCellBounds, Vector2Int maxCellBounds, Vector2Int p)
        {
            //TODO IMPLEMENT
            if (minCellBounds.x > maxCellBounds.x || minCellBounds.y > maxCellBounds.y)
            {
                return false;
            }
            // placeholder logic to be replaced by the student
            return p.x >= minCellBounds.x && p.x <= maxCellBounds.x && p.y >= minCellBounds.y && p.y <= maxCellBounds.y;
        }




        // IsRangeOverlapping(): Determines if the range (inclusive) from min1 to max1 overlaps the range (inclusive) from min2 to max2.
        // The ranges are considered to overlap if one or more values is within the range of both.
        // Returns true if overlap, false otherwise.
        // Preconditions: min1 <= max1 AND min2 <= max2
        static bool IsRangeOverlapping(int min1, int max1, int min2, int max2)
        {
            // TODO IMPLEMENT
            if (min1 > max1 || min2 > max2)
            {
                return false;
            }
            return (min1 <= max2 && min1 >= min2) || (max1 <= max2 && max1 >= min2);
        }



        // IsAxisAlignedBouningBoxOverlapping(): Determines if the AABBs defined by min1,max1 and min2,max2 overlap or touch
        // Returns true if overlap, false otherwise.
        // Preconditions: min1 <= max1, per dimension. min2 <= max2 per dimension
        static bool IsAxisAlignedBoundingBoxOverlapping(Vector2Int min1, Vector2Int max1, Vector2Int min2, Vector2Int max2)
        {
            // TODO IMPLEMENT
            // HINT: Call IsRangeOverlapping()
            return IsRangeOverlapping(min1.x, max1.x, min2.x, max2.x) && IsRangeOverlapping(min1.y, max1.y, min2.y, max2.y);
        }

        static bool IsConnected(int min1, int max1, int min2, int max2)
        {
            return min1 == max2 || min2 == max1;
        }

        static bool OnlyShareEdges(Vector2Int min1, Vector2Int max1, Vector2Int min2, Vector2Int max2)
        {
            return IsConnected(min1.x, max1.x, min2.x, max2.x) || IsConnected(min1.y, max1.y, min2.y, max2.y);
        }





        // IsTraversable(): returns true if the grid is traversable from grid[x,y] in the direction dir, false otherwise.
        // The grid boundaries are not traversable. If the grid position x,y is itself not traversable but the grid cell in direction
        // dir is traversable, the function will return false.
        // returns false if the grid is null, grid rank is not 2 dimensional, or any dimension of grid is zero length
        // returns false if x,y is out of range
        // Note: public methods are autograded
        public static bool IsTraversable(bool[,] grid, int x, int y, TraverseDirection dir)
        {
            // TODO IMPLEMENT

            //placeholder logic to be replaced by the student
            if (grid == null || grid.GetLength(0) == 0 || grid.GetLength(1) == 0 || x < 0 || x >= grid.GetLength(0) || y < 0 || y >= grid.GetLength(1) || !grid[x, y])
            {
                return false;
            }

            switch (dir)
            {
                case TraverseDirection.Up:
                    return !(y + 1 < 0 || y + 1 >= grid.GetLength(1) || !grid[x, y + 1]);
                case TraverseDirection.Down:
                    return !(y - 1 < 0 || y - 1 >= grid.GetLength(1) || !grid[x, y - 1]);
                case TraverseDirection.Left:
                    return !(x - 1 < 0 || x - 1 >= grid.GetLength(0) || !grid[x - 1, y]);
                case TraverseDirection.Right:
                    return !(x + 1 < 0 || x + 1 >= grid.GetLength(0) || !grid[x + 1, y]);
                case TraverseDirection.UpLeft:
                    return !(x - 1 < 0 || x - 1 >= grid.GetLength(0) || y + 1 < 0 || y + 1 >= grid.GetLength(1) || !grid[x - 1, y + 1]);
                case TraverseDirection.UpRight:
                    return !(x + 1 < 0 || x + 1 >= grid.GetLength(0) || y + 1 < 0 || y + 1 >= grid.GetLength(1) || !grid[x + 1, y + 1]);
                case TraverseDirection.DownLeft:
                    return !(x - 1 < 0 || x - 1 >= grid.GetLength(0) || y - 1 < 0 || y - 1 >= grid.GetLength(1) || !grid[x - 1, y - 1]);
                case TraverseDirection.DownRight:
                    return !(x + 1 < 0 || x + 1 >= grid.GetLength(0) || y - 1 < 0 || y - 1 >= grid.GetLength(1) || !grid[x + 1, y - 1]);
                default:
                    return false;
            }
        }


        // Create(): Creates a grid lattice discretized space for navigation.
        // canvasOrigin: bottom left corner of navigable region in world coordinates
        // canvasWidth: width of navigable region in world dimensions
        // canvasHeight: height of navigable region in world dimensions
        // cellWidth: target cell width (of a grid cell) in world dimensions
        // obstacles: a list of collider obstacles
        // grid: an array of bools. A cell is true if navigable, false otherwise
        //    Example: grid[x_pos, y_pos]

        public static void Create(Vector2 canvasOrigin, float canvasWidth, float canvasHeight, float cellWidth,
            List<Polygon> obstacles,
            out bool[,] grid
            )
        {
            var mapOrigin = Convert(canvasOrigin);
            canvasWidth *= 1000;
            canvasHeight *= 1000;
            cellWidth *= 1000;
            Debug.Log("Create: " + mapOrigin + " " + canvasWidth + " " + canvasHeight + " " + cellWidth);
            // ignoring the obstacles for this limited demo; 
            // Marks cells of the grid untraversable if geometry intersects interior!
            // Carefully consider all possible geometry interactions

            // also ignoring the world boundary defined by canvasOrigin and canvasWidth and canvasHeight

            int gridWidth = (int)(canvasWidth / cellWidth);
            int gridHeight = (int)(canvasHeight / cellWidth);
            grid = new bool[gridWidth, gridHeight];
            for (int x = 0; x < gridWidth; ++x)
            {
                for (int y = 0; y < gridHeight; ++y)
                {
                    grid[x, y] = true;
                    Vector2Int min = new Vector2Int(mapOrigin.x + (int)(x * cellWidth), mapOrigin.y + (int)(y * cellWidth));
                    Vector2Int max = new Vector2Int(mapOrigin.x + (int)((x + 1) * cellWidth), mapOrigin.y + (int)((y + 1) * cellWidth));
                    foreach (var obstacle in obstacles)
                    {
                        var points = obstacle.getIntegerPoints();
                        var cellPoints = GetPoints(min, max).ToArray();
                        // check if cell points are in the obstacle
                        foreach (var p in points)
                        {
                            if (IsPointInsidePolygon(cellPoints, p))
                            {
                                // if (!OnlyShareEdges(min, max, obstacle.MinIntBounds, obstacle.MaxIntBounds) || points.Length > 4)
                                // {
                                grid[x, y] = false;
                                break;
                                // }

                            }
                        }
                        if (!grid[x, y])
                        {
                            break;
                        }
                        // check if obstacle points are in the cell
                        foreach (var cp in cellPoints)
                        {
                            if (IsPointInsidePolygon(points, cp))
                            {
                                // if (!OnlyShareEdges(min, max, obstacle.MinIntBounds, obstacle.MaxIntBounds) || points.Length > 4)
                                // {
                                grid[x, y] = false;
                                break;
                                // }
                            }
                        }
                        if (!grid[x, y])
                        {
                            break;
                        }
                        // check if obstacle edges cross cell edges
                        for (int i = 0; i < cellPoints.Length - 1; ++i)
                        {
                            for (int j = 0; j < points.Length - 1; ++j)
                            {
                                if (CG.Intersect(cellPoints[i], cellPoints[i + 1], points[j], points[j + 1]))
                                {
                                    // if (!OnlyShareEdges(min, max, obstacle.MinIntBounds, obstacle.MaxIntBounds) || points.Length > 4)
                                    // {
                                    grid[x, y] = false;
                                    break;
                                    // }
                                }
                            }
                        }
                    }
                }
            }
        }

        private static List<Vector2Int> GetPoints(Vector2Int minBounds, Vector2Int maxBounds)
        {
            var edges = new List<Vector2Int>();
            edges.Add(new Vector2Int(minBounds.x + 1, minBounds.y + 1));
            edges.Add(new Vector2Int(maxBounds.x - 1, minBounds.y + 1));
            edges.Add(new Vector2Int(maxBounds.x - 1, maxBounds.y - 1));
            edges.Add(new Vector2Int(minBounds.x + 1, maxBounds.y - 1));

            Debug.Assert(CG.Ccw(edges.ToArray()), "SETUP FAILURE: polygon verts not listed CCW");

            return edges;
        }

    }

}