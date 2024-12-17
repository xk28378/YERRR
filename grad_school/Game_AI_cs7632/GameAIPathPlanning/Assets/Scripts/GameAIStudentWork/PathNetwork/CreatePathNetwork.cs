// Remove the line above if you are subitting to GradeScope for a grade. But leave it if you only want to check
// that your code compiles and the autograder can access your public methods.

using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace GameAICourse
{

    public class CreatePathNetwork
    {

        public const string StudentAuthorName = "Nehmya Negash";




        // Helper method provided to help you implement this file. Leave as is.
        // Returns Vector2 converted to Vector2Int according to default scaling factor (1000)
        public static Vector2Int ConvertToInt(Vector2 v)
        {
            return CG.Convert(v);
        }

        // Helper method provided to help you implement this file. Leave as is.
        // Returns float converted to int according to default scaling factor (1000)
        public static int ConvertToInt(float v)
        {
            return CG.Convert(v);
        }

        // Helper method provided to help you implement this file. Leave as is.
        // Returns Vector2Int converted to Vector2 according to default scaling factor (1000)
        public static Vector2 ConvertToFloat(Vector2Int v)
        {
            float f = 1f / (float)CG.FloatToIntFactor;
            return new Vector2(v.x * f, v.y * f);
        }

        // Helper method provided to help you implement this file. Leave as is.
        // Returns int converted to float according to default scaling factor (1000)
        public static float ConvertToFloat(int v)
        {
            float f = 1f / (float)CG.FloatToIntFactor;
            return v * f;
        }


        // Helper method provided to help you implement this file. Leave as is.
        // Returns true is segment AB intersects CD properly or improperly
        static public bool Intersects(Vector2Int a, Vector2Int b, Vector2Int c, Vector2Int d)
        {
            return CG.Intersect(a, b, c, d);
        }

        // Helper method provided to help you implement this file. Leave as is.
        // Returns true is segment AB intersects CD properly or improperly
        static public bool Intersects(Vector2 a, Vector2 b, Vector2 c, Vector2 d)
        {
            return CG.Intersect(CG.Convert(a), CG.Convert(b), CG.Convert(c), CG.Convert(d));
        }


        //Get the shortest distance from a var to a line
        //Line is defined by the lineStart and lineEnd points
        public static float DistanceToLineSegment(Vector2Int point, Vector2Int lineStart, Vector2Int lineEnd)
        {
            return CG.DistanceToLineSegment(point, lineStart, lineEnd);
        }


        //Get the shortest distance from a var to a line
        //Line is defined by the lineStart and lineEnd points
        public static float DistanceToLineSegment(Vector2 point, Vector2 lineStart, Vector2 lineEnd)
        {
            return CG.DistanceToLineSegment(point, lineStart, lineEnd);
        }


        // Helper method provided to help you implement this file. Leave as is.
        // Determines if a var is inside/on a CCW polygon and if so returns true. False otherwise.
        public static bool IsPointInPolygon(Vector2Int[] polyPts, Vector2Int point)
        {
            return CG.PointPolygonIntersectionType.Outside != CG.InPoly1(polyPts, point);
        }

        // Returns true iff p is strictly to the left of the directed
        // line through a to b.
        // You can use this method to determine if 3 adjacent CCW-ordered
        // vertices of a polygon form a convex or concave angle

        public static bool Left(Vector2Int a, Vector2Int b, Vector2Int p)
        {
            return CG.Left(a, b, p);
        }

        // Vector2 version of above
        public static bool Left(Vector2 a, Vector2 b, Vector2 p)
        {
            return CG.Left(CG.Convert(a), CG.Convert(b), CG.Convert(p));
        }






        //Student code to build the path network from the given pathNodes and Obstacles
        //Obstacles - List of obstacles on the plane
        //agentRadius - the radius of the traversing agent
        //minPoVDist AND maxPoVDist - used for Points of Visibility (see assignment doc)
        //pathNodes - ref parameter that contains the pathNodes to connect (or return if pathNetworkMode is set to PointsOfVisibility)
        //pathEdges - out parameter that will contain the edges you build.
        //  Edges cannot intersect with obstacles or boundaries. Edges must be at least agentRadius distance
        //  from all obstacle/boundary line segments. No self edges, duplicate edges. No null lists (but can be empty)
        //pathNetworkMode - enum that specifies PathNetwork type (see assignment doc)

        public static void Create(Vector2 canvasOrigin, float canvasWidth, float canvasHeight,
            List<Polygon> obstacles, float agentRadius, float minPoVDist, float maxPoVDist, ref List<Vector2> pathNodes, out List<List<int>> pathEdges,
            PathNetworkMode pathNetworkMode)
        {

            //STUDENT CODE HERE
            // Debug.Log("Canvas Origin: " + canvasOrigin.x + ", " + canvasOrigin.y);
            // Debug.Log("Canvas Width: " + canvasWidth);
            // Debug.Log("Canvas Height: " + canvasHeight);
            // foreach (var node in pathNodes){
            //     Debug.Log("Node: " + node.x + ", " + node.y);
            // }
            var isValid = new bool[pathNodes.Count];
            var minX = canvasOrigin.x;
            var minY = canvasOrigin.y;
            var maxX = canvasOrigin.x + canvasWidth;
            var maxY = canvasOrigin.y + canvasHeight;
            // Debug.Log("minX: " + minX + ", minY: " + minY + ", maxX: " + maxX + ", maxY: " + maxY);
            for (int i = 0; i < pathNodes.Count; ++i)
            {
                isValid[i] = true;
                if (pathNodes[i].x - agentRadius < minX || pathNodes[i].x + agentRadius > maxX || pathNodes[i].y - agentRadius < minY || pathNodes[i].y + agentRadius > maxY)
                {
                    // Debug.Log("Node was too close to the boundary");
                    isValid[i] = false;
                    continue;
                }
                foreach (var obstacle in obstacles)
                {
                    var points = obstacle.getPoints();
                    for (int j = 0; j < points.Length - 1; ++j)
                    {
                        if (DistanceToLineSegment(pathNodes[i], points[j], points[j + 1]) <= agentRadius)
                        {
                            // Debug.Log("Distance to obstacle was too close");
                            isValid[i] = false;
                            break;
                        }
                    }
                    if (!isValid[i]) break;
                }
            }
            // Debug.Log("isValid: " + string.Join(",", isValid));

            pathEdges = new List<List<int>>(pathNodes.Count);

            for (int i = 0; i < pathNodes.Count; ++i)
            {
                if (!isValid[i])
                {
                    pathEdges.Add(new List<int>());
                    continue;
                }
                var currNodeEdges = new List<int>();
                for (int j = 0; j < pathNodes.Count; ++j)
                {
                    if (i != j && isValid[j])
                    {
                        var A = pathNodes[i];
                        var B = pathNodes[j];
                        // Debug.Log("Path: " + A.x + ", " + A.y + " " + B.x + ", " + B.y);
                        var pathPolygon = GetPathPolygon(A, B, agentRadius);
                        var intersects = false;
                        foreach (var obstacle in obstacles)
                        {
                            var points = obstacle.getIntegerPoints();
                            // Debug.Log("original path polygon: " + pathPolygon.ToArray());
                            var cellPoints = CG.Convert(pathPolygon.ToArray());
                            // Debug.Log("cell points: " + string.Join(",", cellPoints));
                            // check if cell points are in the obstacle
                            foreach (var p in points)
                            {
                                if (IsPointInPolygon(cellPoints, p))
                                {
                                    intersects = true;
                                    break;

                                }
                            }
                            if (intersects)
                            {
                                // Debug.Log("Intersect because obstacle points are in pathPolygon");
                                break;
                            }
                            // check if obstacle points are in the cell
                            foreach (var cp in cellPoints)
                            {
                                if (IsPointInPolygon(points, cp))
                                {
                                    intersects = true;
                                    break;
                                }
                            }
                            if (intersects)
                            {
                                // Debug.Log("Intersect because pathPolygon points are in obstacle");
                                break;
                            }
                            // check if obstacle edges cross cell edges
                            for (int k = 0; k < cellPoints.Length - 1; ++k)
                            {
                                for (int l = 0; l < points.Length - 1; ++l)
                                {
                                    if (CG.Intersect(cellPoints[k], cellPoints[k + 1], points[l], points[l + 1]))
                                    {
                                        // Debug.Log("Intersect because pathPolygon edges cross obstacle edges");
                                        // Debug.Log("Points: " + cellPoints[k] + " " + cellPoints[k + 1] + " " + points[l] + " " + points[l + 1]);
                                        intersects = true;
                                        break;
                                    }
                                }
                            }
                            if (intersects) break;
                        }
                        if (!intersects) currNodeEdges.Add(j);
                        // Debug.Log("Pair: " + i + " " + j + " " + currNodeEdges.Count);
                    }
                }
                pathEdges.Add(currNodeEdges);

            }


            // END STUDENT CODE

        }

        public static List<Vector2> GetPathPolygon(Vector2 A, Vector2 B, float distance)
        {
            List<Vector2> polygon = new List<Vector2>();
            var x1 = A.x;
            var y1 = A.y;
            var x2 = B.x;
            var y2 = B.y;
            // Direction vector (dx, dy)
            float dx = x2 - x1;
            float dy = y2 - y1;

            // Magnitude of the direction vector
            float magnitude = (float)Math.Sqrt(dx * dx + dy * dy);

            // Normalized perpendicular vectors
            float perpX1 = -dy / magnitude;
            float perpY1 = dx / magnitude;
            float perpX2 = dy / magnitude;
            float perpY2 = -dx / magnitude;

            // First parallel line (shift by the perpendicular vector * distance)
            float ax1 = x1 + perpX1 * distance;
            float ay1 = y1 + perpY1 * distance;
            float bx1 = x2 + perpX1 * distance;
            float by1 = y2 + perpY1 * distance;

            // Second parallel line (shift by the opposite perpendicular vector * distance)
            float ax2 = x1 + perpX2 * distance;
            float ay2 = y1 + perpY2 * distance;
            float bx2 = x2 + perpX2 * distance;
            float by2 = y2 + perpY2 * distance;

            polygon.Add(new Vector2(ax1, ay1));
            polygon.Add(new Vector2(bx1, by1));
            polygon.Add(new Vector2(bx2, by2));
            polygon.Add(new Vector2(ax2, ay2));
            // Return the polygon
            return polygon;
        }


    }

}