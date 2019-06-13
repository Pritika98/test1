using Microsoft.VisualStudio.TestTools.UnitTesting;
using simplecalc;
namespace UnitTestProject1
{
    [TestClass]
    public class UnitTest1
    {
        Program p = new Program();
        [TestMethod]
        public void TestMethod1()
        {
            int a = 6;
            int b = 3;
            int ex = 9;
            int r = p.Add(a, b);
            Assert.AreEqual(r, ex);
        }

        [TestMethod]
        public void TestMethod2()
        {
            int a = 6;
            int b = 3;
            int ex = 3;
            int r = p.Sub(a, b);
            Assert.AreEqual(r, ex);
        }

        [TestMethod]
        public void TestMethod3()
        {
            int a = 6;
            int b = 3;
            int ex = 18;
            int r = p.Mul(a, b);
            Assert.AreEqual(r, ex);
        }

        [TestMethod]
        public void TestMethod4()
        {
            int a = 6;
            int b = 3;
            int ex = 4;
            int r = p.Div(a, b);
            Assert.AreEqual(r, ex);
        }
    }
}
