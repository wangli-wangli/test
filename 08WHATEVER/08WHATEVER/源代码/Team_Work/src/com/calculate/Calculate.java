package com.calculate;
import java.text.DecimalFormat;
public interface Calculate {
	public int addTwenty(int add1,int add2);
	//整数加法 20以内加法需要进位
	public int addHundred(int add1,int add2);
	//100以内加法 一年级下册
	public int addHundredAdvance(int add1,int add2);
	//100以内进位加法
	int addTenthousand(int add1,int add2);
	//万以内的加法 三年级上册
	public int addMolecule(int molecule1,int denominator1,int molecule2,int denominator2);
	//返回和之分子
	public int addDenominator(int molecule1,int denominator1,int molecule2,int denominator2);
	//返回和之分母
	public String addDecimal(int  add1, int  add2);
	//小数加法
    public int subtractionHundred(int subtract1,int subtract2);
    //整数减法 100以内减法
    public int subtractionHundredAdvance(int subtract1,int subtract2);
    //整数减法 100以内减法进位 二年级下册  
    public int subtractionNegative(int subtract1,int subtract2);
    //负数的减
    public int subtractionTenthousand(int subtract1,int subtract2);
    //万以内的减法 三年级上册
    public int subtractionMolecule(int molecule1,int denominator1,int molecule2,int denominator2);
  //返回差之分子
	public int subtractionDenominator(int molecule1,int denominator1,int molecule2,int denominator2);
	//返回差之分母
    public String subtraction(int subtract1,int subtract2);
  //小数减法
    public int multiplyNine(int multiply1,int multiply2);
  //整数乘法 二年级上册 九九乘法
    public int multiplyMoreOne(int multiply1,int multiply2);
  //多位数乘以一位数 三年级上册
    public int multiplyTwo(int multiply1,int multiply2);
    //两位数的乘法 三年级下册
    public int multiplyThreeTwo(int multiply1,int multiply2);
  //三位数乘以两位数 四年级上册
    public String multiplyDecimalInteger(int multiply1,int multiply2);
  //整数与小数的乘法 五年级上册
    public String multiplyDecimal(int multiply1,int multiply2);
    //小数与小数的乘法 五年级下册
    public int multiplyMolecule(int molecule1,int denominator1,int molecule2,int denominator2);
  //返回差之分子
	public int multiplyDenominator(int molecule1,int denominator1,int molecule2,int denominator2);
	//返回差之分母
    public int dividMoreOne(int dividend,int divid);
    //多位数除以一位数 三年级下册
    public int dividTwo(int dividend,int divid);
  //除数是两位数的除法
    public int dividTable(int dividend,int divid);
  //表内除法
    public int dividOutTable(int dividend,int divid);
    //表外除法，有余数 返回除法整数
    public int dividOutTableRemainder(int dividend,int divid);
    //余数 返回余数
    public int dividMolecule(int molecule1,int denominator1,int molecule2,int denominator2);
  //返回差之分子
	public int dividDenominator(int molecule1,int denominator1,int molecule2,int denominator2);
	//返回差之分母
    public String dividIntDecimal(int dividend,int divid);
  //整数除以小数  五年级上册
    public String dividDecinmalInt(int dividend,int divid);
    //小数除以整数 五年级上册
    public int maxCommenDivisor(int num1,int num2);
  //求两数的最大公约数
    public int minCommenMultiply(int num1,int num2);
    //求两数的最小公倍数
    
   
}
