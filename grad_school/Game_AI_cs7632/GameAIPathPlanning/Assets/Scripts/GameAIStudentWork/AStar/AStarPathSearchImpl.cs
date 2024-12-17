// Remove the line above if you are subitting to GradeScope for a grade. But leave it if you only want to check
// that your code compiles and the autograder can access your public methods.

using System.Collections;
using System.Collections.Generic;
using Priority_Queue;
using UnityEngine;
using System;


namespace GameAICourse
{


    public class AStarPathSearchImpl
    {

        // Please change this string to your name
        public const string StudentAuthorName = "Nehmya Negash";


        // Null Heuristic for Dijkstra
        public static float HeuristicNull(Vector2 nodeA, Vector2 nodeB)
        {
            return 0f;
        }

        // Null Cost for Greedy Best First
        public static float CostNull(Vector2 nodeA, Vector2 nodeB)
        {
            return 0f;
        }



        // Heuristic distance fuction implemented with manhattan distance
        public static float HeuristicManhattan(Vector2 nodeA, Vector2 nodeB)
        {
            //STUDENT CODE HERE

            // The following code is just a placeholder so that the method has a valid return
            // You will replace it with the correct implementation
            return Math.Abs(nodeA.x - nodeB.x) + Math.Abs(nodeA.y - nodeB.y);

            //END CODE 
        }

        // Heuristic distance function implemented with Euclidean distance
        public static float HeuristicEuclidean(Vector2 nodeA, Vector2 nodeB)
        {
            //STUDENT CODE HERE

            // The following code is just a placeholder so that the method has a valid return
            // You will replace it with the correct implementation
            return (float)Math.Sqrt(Math.Pow(nodeA.x - nodeB.x, 2) + Math.Pow(nodeA.y - nodeB.y, 2));

            //END CODE 
        }


        // Cost is only ever called on adjacent nodes. So we will always use Euclidean distance.
        // We could use Manhattan dist for 4-way connected grids and avoid sqrroot and mults.
        // But we will avoid that for simplicity.
        public static float Cost(Vector2 nodeA, Vector2 nodeB)
        {
            //STUDENT CODE HERE

            // The following code is just a placeholder so that the method has a valid return
            // You will replace it with the correct implementation
            return HeuristicEuclidean(nodeA, nodeB);

            //END STUDENT CODE
        }



        public static PathSearchResultType FindPathIncremental(
            GetNodeCount getNodeCount,
            GetNode getNode,
            GetNodeAdjacencies getAdjacencies,
            CostCallback G,
            CostCallback H,
            int startNodeIndex, int goalNodeIndex,
            int maxNumNodesToExplore, bool doInitialization,
            ref int currentNodeIndex,
            ref Dictionary<int, PathSearchNodeRecord> searchNodeRecords,
            ref SimplePriorityQueue<int, float> openNodes, ref HashSet<int> closedNodes, ref List<int> returnPath)
        {
            PathSearchResultType pathResult = PathSearchResultType.InProgress;

            var nodeCount = getNodeCount();

            if (startNodeIndex >= nodeCount || goalNodeIndex >= nodeCount ||
                startNodeIndex < 0 || goalNodeIndex < 0 ||
                maxNumNodesToExplore <= 0 ||
                (!doInitialization &&
                 (openNodes == null || closedNodes == null || currentNodeIndex < 0 ||
                  currentNodeIndex >= nodeCount)))

                return PathSearchResultType.InitializationError;
            Debug.Log("startNodeIndex: " + startNodeIndex);

            // STUDENT CODE HERE
            if (doInitialization)
            {

                searchNodeRecords = new Dictionary<int, PathSearchNodeRecord>();
                searchNodeRecords[startNodeIndex] = new PathSearchNodeRecord(startNodeIndex, -1, 0, H(getNode(startNodeIndex), getNode(goalNodeIndex)));
                openNodes = new SimplePriorityQueue<int, float>();
                openNodes.Enqueue(startNodeIndex, 0f);
                closedNodes = new HashSet<int>();
                returnPath = new List<int>();
            }
            int visitedNodes = 0;

            while (visitedNodes < maxNumNodesToExplore && openNodes.Count > 0)
            {
                currentNodeIndex = openNodes.Dequeue();
                // if (currentNodeIndex != startNodeIndex)
                // {
                //     Debug.Log("Current Node cost: " + searchNodeRecords[currentNodeIndex].EstimatedTotalCost);
                // }
                closedNodes.Add(currentNodeIndex);
                // Debug.Log("closed nodes: " + closedNodes.Count);
                if (currentNodeIndex == goalNodeIndex)
                {
                    // Debug.Log("Path Found!");
                    RetracePath(startNodeIndex, currentNodeIndex, ref searchNodeRecords, ref returnPath);
                    pathResult = PathSearchResultType.Complete;
                    return pathResult;
                }
                var adjs = getAdjacencies(currentNodeIndex);
                for (int j = 0; j < adjs.Count; j++)
                {
                    if (closedNodes.Contains(adjs[j])) continue;
                    var costSoFar = searchNodeRecords[currentNodeIndex].CostSoFar + G(getNode(currentNodeIndex), getNode(adjs[j]));
                    var heuristic = H(getNode(adjs[j]), getNode(goalNodeIndex));
                    if(searchNodeRecords.ContainsKey(adjs[j]) && costSoFar >= searchNodeRecords[adjs[j]].CostSoFar) continue;
                    if (!openNodes.Contains(adjs[j])){
                        openNodes.Enqueue(adjs[j], costSoFar + heuristic);
                    }else {
                        openNodes.UpdatePriority(adjs[j], costSoFar + heuristic);
                    }
                    searchNodeRecords[adjs[j]] = new PathSearchNodeRecord(adjs[j], currentNodeIndex, costSoFar, costSoFar + heuristic);
                }
                visitedNodes++;
            }

            if (openNodes.Count == 0)
            {
                var closestDistance = float.MaxValue;
                var closestNode = -1;
                foreach (var indx in closedNodes){
                    var dist = H(getNode(indx), getNode(goalNodeIndex));
                    if (dist < closestDistance){
                        closestDistance = dist;
                        closestNode = indx;
                    }
                }
                RetracePath(startNodeIndex, closestNode, ref searchNodeRecords, ref returnPath);
                pathResult = PathSearchResultType.Partial;
                return pathResult;
            }
            else
            {
                pathResult = PathSearchResultType.InProgress;
                return pathResult;
            }



            // // The following code is just a placeholder so that the method has a valid return
            // // You will replace it with the correct implementation

            // pathResult = PathSearchResultType.Complete;

            // searchNodeRecords = new Dictionary<int, PathSearchNodeRecord>();
            // openNodes = new SimplePriorityQueue<int, float>();
            // closedNodes = new HashSet<int>();

            // returnPath = new List<int>();

            // returnPath.Add(startNodeIndex);

            // return pathResult;

            //END STUDENT CODE HERE
        }

        private static void RetracePath(int start, int end, ref Dictionary<int, PathSearchNodeRecord> searchNodeRecords, ref List<int> returnPath)
        {

            var curr = end;

            while (curr != start)
            {
                returnPath.Add(curr);
                curr = searchNodeRecords[curr].FromNodeIndex;
            }
            returnPath.Reverse();
        }

    }

}