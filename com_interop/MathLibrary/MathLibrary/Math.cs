using System;
using System.Runtime.InteropServices;

namespace MathLibrary
{
    // Make sure to set [assembly: ComVisible(true)]
    // in AssemblyInfo.cs

    // under build settings
    // Register for com interop

    // Build for 'any cpu' fails choose x64


    // Interface declaration.
   [ComVisible(true)]
   [Guid("66DE2FB9-7A3B-4C33-AF26-9AD5EDD4C71F")]
   [InterfaceType(ComInterfaceType.InterfaceIsDual)]
   public interface IMathLibrary
   {
       [DispId(1)]
       string multiply(int a, int b);
    };
    
    // Class declaration
    [ComVisible(true)]
    [Guid("021E950E-3612-4FAD-9F15-F61632A95BD8")]
    [ClassInterface(ClassInterfaceType.None)]
    [ProgId("MathLibrary.MathCalc")]
    public class MathCalc : IMathLibrary
    {
        public string multiply(int a, int b)
        {
            return "Product is " + (a * b).ToString();
        }
    }
}
