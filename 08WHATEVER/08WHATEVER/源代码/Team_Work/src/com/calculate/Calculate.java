package com.calculate;
import java.text.DecimalFormat;
public interface Calculate {
	public int addTwenty(int add1,int add2);
	//�����ӷ� 20���ڼӷ���Ҫ��λ
	public int addHundred(int add1,int add2);
	//100���ڼӷ� һ�꼶�²�
	public int addHundredAdvance(int add1,int add2);
	//100���ڽ�λ�ӷ�
	int addTenthousand(int add1,int add2);
	//�����ڵļӷ� ���꼶�ϲ�
	public int addMolecule(int molecule1,int denominator1,int molecule2,int denominator2);
	//���غ�֮����
	public int addDenominator(int molecule1,int denominator1,int molecule2,int denominator2);
	//���غ�֮��ĸ
	public String addDecimal(int  add1, int  add2);
	//С���ӷ�
    public int subtractionHundred(int subtract1,int subtract2);
    //�������� 100���ڼ���
    public int subtractionHundredAdvance(int subtract1,int subtract2);
    //�������� 100���ڼ�����λ ���꼶�²�  
    public int subtractionNegative(int subtract1,int subtract2);
    //�����ļ�
    public int subtractionTenthousand(int subtract1,int subtract2);
    //�����ڵļ��� ���꼶�ϲ�
    public int subtractionMolecule(int molecule1,int denominator1,int molecule2,int denominator2);
  //���ز�֮����
	public int subtractionDenominator(int molecule1,int denominator1,int molecule2,int denominator2);
	//���ز�֮��ĸ
    public String subtraction(int subtract1,int subtract2);
  //С������
    public int multiplyNine(int multiply1,int multiply2);
  //�����˷� ���꼶�ϲ� �žų˷�
    public int multiplyMoreOne(int multiply1,int multiply2);
  //��λ������һλ�� ���꼶�ϲ�
    public int multiplyTwo(int multiply1,int multiply2);
    //��λ���ĳ˷� ���꼶�²�
    public int multiplyThreeTwo(int multiply1,int multiply2);
  //��λ��������λ�� ���꼶�ϲ�
    public String multiplyDecimalInteger(int multiply1,int multiply2);
  //������С���ĳ˷� ���꼶�ϲ�
    public String multiplyDecimal(int multiply1,int multiply2);
    //С����С���ĳ˷� ���꼶�²�
    public int multiplyMolecule(int molecule1,int denominator1,int molecule2,int denominator2);
  //���ز�֮����
	public int multiplyDenominator(int molecule1,int denominator1,int molecule2,int denominator2);
	//���ز�֮��ĸ
    public int dividMoreOne(int dividend,int divid);
    //��λ������һλ�� ���꼶�²�
    public int dividTwo(int dividend,int divid);
  //��������λ���ĳ���
    public int dividTable(int dividend,int divid);
  //���ڳ���
    public int dividOutTable(int dividend,int divid);
    //��������������� ���س�������
    public int dividOutTableRemainder(int dividend,int divid);
    //���� ��������
    public int dividMolecule(int molecule1,int denominator1,int molecule2,int denominator2);
  //���ز�֮����
	public int dividDenominator(int molecule1,int denominator1,int molecule2,int denominator2);
	//���ز�֮��ĸ
    public String dividIntDecimal(int dividend,int divid);
  //��������С��  ���꼶�ϲ�
    public String dividDecinmalInt(int dividend,int divid);
    //С���������� ���꼶�ϲ�
    public int maxCommenDivisor(int num1,int num2);
  //�����������Լ��
    public int minCommenMultiply(int num1,int num2);
    //����������С������
    
   
}
