using System;

namespace simplecalc
{
   public class Program
    {
        public int Add(int x,int y)
        {
            return (x + y);
        }
        public int Sub(int x,int y)
        {
            return (x - y);
        }
        public int Mul(int x,int y)
        {
            return (x * y);
        }
        public int Div(int x,int y)
        {
            return (x / y);
        }
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            int a,b,c=0;
            Console.WriteLine("Enter two numbers : ");
            a = Convert.ToInt32(Console.ReadLine());
            b = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter the operation: ");
            Console.WriteLine("1.Add");
            Console.WriteLine("2.Subtract");
            Console.WriteLine("3.Multiply");
            Console.WriteLine("4.Divide");
            int d = Convert.ToInt32(Console.ReadLine());
            switch (d)
            {
                case 1:
                    c = a + b;
                    Console.WriteLine("hi");
                    break;
                case 2:
                    c = a - b;
                    break;
                case 3:
                    c = a * b;
                    break;
                case 4:
                    c = a / b;
                    break;
                default:
                    Console.WriteLine("Invalid option!");
                    break;

            }
            Console.WriteLine("The result is " +c);
        }
    }
}
