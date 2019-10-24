class Busca
   {
   public static void main(String[] args)
      {
       
      Graph theGraph = new Graph();
      theGraph.addVertex('B');  //0  
      theGraph.addVertex('C');  //1
      theGraph.addVertex('D');  //2
      theGraph.addVertex('G');  //3
      theGraph.addVertex('M');  //4
      theGraph.addVertex('R');  //5
      theGraph.addVertex('S');  //6
      theGraph.addVertex('V');  //7

      theGraph.addEdge(0, 2);  //BD
      theGraph.addEdge(0, 3);  //BG     
      theGraph.addEdge(0, 4);  //BM   
      theGraph.addEdge(0, 5);  //BR   
      theGraph.addEdge(0, 6);  //BS   

      theGraph.addEdge(1, 6);  //CS   
      
      theGraph.addEdge(2, 0);  //DB   
      theGraph.addEdge(2, 3);  //DG   
      
      theGraph.addEdge(3, 0);  //GB   
      theGraph.addEdge(3, 2);  //GD   
     
      theGraph.addEdge(4, 0);  //MB   
      theGraph.addEdge(4, 7);  //MV   

      theGraph.addEdge(5, 0);  //RB   
      theGraph.addEdge(5, 6);  //RS   
      theGraph.addEdge(5, 7);  //RV   
      
      theGraph.addEdge(6, 0);  //SB   
      theGraph.addEdge(6, 1);  //SC   
      theGraph.addEdge(6, 5);  //SR   
      
      theGraph.addEdge(7, 4);  //VM   
      theGraph.addEdge(7, 5);  //VR   
      
      
      System.out.print("Nos Visitados PROFUNDIDADE: ");
      theGraph.dfs();  
      System.out.print("\nNos Visitados LARGURA: ");
      theGraph.bfs();  
      System.out.print("\nArvore Geradora Minima: ");
      theGraph.mst();  

      System.out.println();
      
      }
   } 