using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Starmap
{
    public partial class Form1 : Form
    {
        private Random rng = new Random();
        List<String> stars = new List<string>();
        List<starData> starDatas = new List<starData>();
        List<List<starData>> clusters = new List<List<starData>>();

        List<starData> currentCluster = new List<starData>();
        bool newStarInCluster = false;

        public void toLua()
        {
            string table = "starfield{";
            foreach(starData data in starDatas)
            {               
                table += "[\"" + data.name + "\"]={" + "[\"name\"]=\"" + data.name + "\", [\"x\"]=" + data.x + ", [\"y\"]=" + data.y + ", connections={";
                for(int i=0;i<data.connections.Count;i++)
                {
                    if (i != 0)
                        table += ",";
                    table += "[" + i.ToString() + "]=\"" + data.connections[i] + "\" ";
                }
                table += "}},";
            }
            table.Remove(table.LastIndexOf(','));
            table += "}";
            textBox1.Text = table;
        }

        public void findClusters()
        {
            clusters = new List<List<starData>>();
            currentCluster = new List<starData>();
            starData[] arr = new starData[starDatas.Count()];
            starDatas.CopyTo(arr);
            List<starData> tmp = new List<starData>(arr);
            int max = tmp.Count;
            do
            {
                tmp = findClustersSub(tmp[0], tmp);
                clusters.Add(currentCluster);
                currentCluster = new List<starData>();
            } while (tmp.Count > 0);
            label1.Text = clusters.Count.ToString();
            
        }

        public List<starData> findClustersSub(starData dat, List<starData> tmp)
        {

            starData _starData = dat;
            bool found = false;
            foreach (String connection in _starData.connections)
            {
                if (currentCluster.Where(a => a.name == connection).Count() == 0 && tmp.Where(a => a.name == connection).Count() > 0)
                {
                    currentCluster.Add(tmp.Where(a => a.name == connection).First());
                    tmp = findClustersSub(tmp.Where(a => a.name == connection).First(),tmp);
                    if(tmp.Where(a => a.name == connection).Count()>0)
                        tmp.Remove(tmp.Where(a => a.name == connection).First());
                }
            }           
            return tmp;
        }

        public class Cluster
        {
            
        }

        public class starData
        {
            public String name="";
            public int x=0;
            public int y=0;
            public List<String> connections = new List<string>();
        }

        public Form1()
        {
            InitializeComponent();
            loadStars();
        }

        private void loadStars()
        {
            String[] lines = File.ReadAllLines("f:\\stars.txt");
            foreach (String line in lines)
            {
                stars.Add(line);
            }
            stars = doShuffle<String>(stars);

       
        }           

        public List<T> doShuffle<T>(List<T> list)
        {
            int n = list.Count;
            while (n > 1)
            {
                n--;
                int k = rng.Next(n + 1);
                T value = list[k];
                list[k] = list[n];
                list[n] = value;
            }
            return list;
        }


        public void findClusterConnections()
        {
            foreach (List<starData> cluster in clusters)
            {
                List<starData> otherCluster = null;

                starData clusterPoint=null;
                starData externalClusterPoint=null;
                int clusterDist = 99999999;


                foreach (starData data in cluster)
                {

                    int shortestWayOuter = 999999999;
                    starData shortestOuter1 = data;
                    starData shortestOuter2 = null;


                    foreach (List<starData> innerCluster in clusters)
                    {
                        int shortestWay = 9999999;
                        starData shortestWayStarData = null;

                        if (innerCluster != cluster)
                        {
                          
                            foreach (starData innerData in innerCluster)
                            {
                                if (Math.Sqrt((new Vector2(data.x, data.y) - new Vector2(innerData.x, innerData.y)).LengthSquared()) < shortestWay)
                                {
                                    shortestWay = (int)Math.Sqrt((new Vector2(data.x, data.y) - new Vector2(innerData.x, innerData.y)).LengthSquared());
                                    shortestWayStarData = innerData;
                                }
                            }
                        }

                        if (shortestWay < shortestWayOuter)
                        {
                            shortestOuter2 = shortestWayStarData;
                            shortestWayOuter = shortestWay;
                        }
                    }                    
                    if(shortestWayOuter<clusterDist)
                    {
                        clusterDist = shortestWayOuter;
                        clusterPoint = shortestOuter1;
                        externalClusterPoint = shortestOuter2;
                    }
                }

                starDatas[starDatas.FindLastIndex(a => a.name == clusterPoint.name)].connections.Add(externalClusterPoint.name);
                starDatas[starDatas.FindLastIndex(a => a.name == externalClusterPoint.name)].connections.Add(clusterPoint.name);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {     
            do
            {
                
                do
                {
                    starDatas = new List<starData>();
                    clusters = new List<List<starData>>();

                    foreach (String star in stars)
                    {
                        starDatas.Add(new starData() { name = star });
                    }

                    for (int i = 0; i < stars.Count; i++)
                    {
                        bool collided = false;
                        int x = rng.Next(1, 512);
                        int y = rng.Next(1, 512);
                        do
                        {
                            collided = false;
                            x = rng.Next(1, 512);
                            y = rng.Next(1, 512);
                            foreach (starData _starData in starDatas)
                            {
                                if (_starData.name != stars[i])
                                {
                                    if (((x < _starData.x + 20 && x > _starData.x - 20) && (y < _starData.y + 20  && y > _starData.y - 20)))
                                        /*(_starData.x > x - 50 && _starData.x < x + 50 && _starData.y > y - 50 && _starData.y < y + 50))*/
                                        collided = true;
                                }
                            }
                        } while (collided);

                        for (int z = 0; z < starDatas.Count; z++)
                        {
                            if (starDatas[z].name == stars[i])
                            {
                                starDatas[z].x = x;
                                starDatas[z].y = y;
                            }
                        }
                    }
                

                for (int i = 0; i < starDatas.Count; i++)
                {
                    foreach (starData _starData in starDatas)
                    {
                        int x = starDatas[i].x;
                        int y = starDatas[i].y;

                        if ((_starData.x > x - 50 && _starData.x < x + 50 && _starData.y > y - 50 && _starData.y < y + 50))
                        {
                            starDatas[i].connections.Add(_starData.name);
                        }
                    }
                }
                } while (starDatas.Where(a => a.connections.Count() <=1).Count() > 0);
                findClusters();                
            } while (clusters.Count > 7 || clusters.Count < 5);
            do
            {
                findClusterConnections();
                findClusters();
            } while (clusters.Count() != 1);

            for(int i=0;i<starDatas.Count;i++)
            {
                starDatas[i].connections.Remove(starDatas[i].name);
            }

            toLua();
            pictureBox1.Refresh();
        }
        Pen pen = new Pen(Color.IndianRed, 3);
        AdjustableArrowCap bigArrow = new AdjustableArrowCap(5, 5);
        private void pictureBox1_Paint(object sender, PaintEventArgs e)
        {
                    if ((sender as PictureBox).Image == null) e.Graphics.Clear(Color.White);

                    // Add this line for high quality drawing:
                    e.Graphics.SmoothingMode = SmoothingMode.HighQuality;

                    foreach(starData _starData in starDatas)
                    {
                        e.Graphics.DrawEllipse(pen, new Rectangle(_starData.x - 3, _starData.y - 3, 6, 6));
                        foreach(String stars in _starData.connections)
                        {
                            starData connected = starDatas.Where(a => a.name == stars).First();
                            e.Graphics.DrawLine(pen, _starData.x, _starData.y, connected.x, connected.y);
                        }
                    }

                    

                    

                    // If you want draw all previous lines here, add bellow code:
                    //foreach (var line in lines)
                    //{
                    //    e.Graphics.DrawLine(pen, line.Item1, line.Item2);
                    //}
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}
