package com.calculate;
import java.text.DecimalFormat;

public class CalculateImpl implements Calculate
{

	@Override
	public int maxCommenDivisor(int num1, int num2) 
	{
		int temp;
		if(num1<num2)
		{
			temp=num1;
			
			num1=num2;
			num2=temp;
		}
		while (num1%num2!=0) 
			
		{
			temp=num1%num2;
			num1=num2;
			num2=temp;
		}
		return num2;
	}

	@Override
	public int minCommenMultiply(int num1, int num2) 
	{
		return num1*num2/maxCommenDivisor(num1, num2);
	}
	@Override
	public int addTwenty(int add1, int add2)
	{
		if(add1+add2<=20&&add1+add2>0)
		{
			return add1+add2;
		}
		return 0;
	}

	@Override
	public int addHundred(int add1, int add2) 
	{
		int remainder1,remainder2;
		remainder1=add1%10;
		remainder2=add2%10;
		if(add1+add2<=100&&add1+add2>=0&&remainder1+remainder2<10&&remainder1+remainder2>=0)
		{
			return add1+add2;
		}
		return 0;
	}

	@Override
	public int addHundredAdvance(int add1, int add2) 
	{
		if(add1+add2<=100&&add1+add2>=0)
		{
			return add1+add2;
		}
		return 0;
	}

	@Override
	public int addTenthousand(int add1, int add2) 
	{
		if(add1+add2<=10000&&add1+add2>=0)
		{
			return add1+add2;
		}
		return 0;
	}
	@Override
	public String addDecimal(int add1, int add2) 
	{
		double add;
		add=(double)(add1+add2)/100;
		DecimalFormat df=new DecimalFormat("#.00");
			return df.format(add);
	}


	@Override
	public int subtractionHundred(int subtract1, int subtract2) 
	{
		int remainder1,remainder2;
		remainder1=subtract1%10;
		remainder2=subtract2%10;
		if(subtract1-subtract2>=0&&subtract1-subtract2<=100&&remainder1>=remainder2)
		{
			return subtract1-subtract2;
		}
		return 0;
	}

	@Override
	public int subtractionHundredAdvance(int subtract1, int subtract2) 
	{
		if(subtract1-subtract2>=0&&subtract1-subtract2<=100)
		{
			return subtract1-subtract2;
		}
		return 0;
	}

	@Override
	public int subtractionTenthousand(int subtract1, int subtract2) 
	{
		if(subtract1-subtract2>=0&&subtract1-subtract2<=10000)
		{
			return subtract1-subtract2;
		}
		return 0;
	}

	@Override
	public String subtraction(int subtract1,int subtract2) 
	{
		double add;
		if(subtract1>=subtract2)
		{
			//鏀�
		add=(double)(subtract1-subtract2)/100;
		DecimalFormat df=new DecimalFormat("#.00");
			return df.format(add);
		}
		return null;
	}

	@Override
	public int multiplyNine(int multiply1, int multiply2) 
	{
		if(multiply1>0&&multiply2<=9&&multiply2>0&&multiply2<=9&&multiply1*multiply2<=81&&multiply1*multiply2>0)
		{
			return multiply1*multiply2;
		}
		return 0;
	}

	@Override
	public int multiplyMoreOne(int multiply1, int multiply2) 
	{
		if((multiply1/10>0&&multiply1/10<100&&multiply2>0&&multiply2<10)||(multiply2/10>0&&multiply2/10<100&&multiply1>0&&multiply1<10))
		{
			return multiply1*multiply2;
		}
		return 0;
	}

	@Override
	public int multiplyTwo(int multiply1, int multiply2) 
	{
		if(multiply1/10>0&&multiply1/10<10&&multiply2/10>0&&multiply2/10<10)
		{
			return multiply1*multiply2;
		}
		return 0;
	}

	@Override
	public int multiplyThreeTwo(int multiply1, int multiply2) 
	{
		if((multiply1/10>9&&multiply1/10<100&&multiply2/10>0&&multiply2/10<10)||(multiply2/10>9&&multiply2/10<100&&multiply1/10>0&&multiply1/10<10))
		{
			return multiply1*multiply2;
		}
		return 0;
	}

	@Override
	public String multiplyDecimalInteger(int multiply1, int multiply2) 
	{
		
		double union,Multiply2;
		Multiply2=(double)multiply2/100;
		union=(double)((double)multiply1*Multiply2);
		DecimalFormat df=new DecimalFormat("#.00");
		if(union<1)
			return "0"+df.format(union);
		else
		return df.format(union);
	}

	@Override
	public String multiplyDecimal(int multiply1, int multiply2) 
	{
		double union,Multiply1,Multiply2;
		Multiply1=(double)multiply1/100;
		Multiply2=(double)multiply2/100;
		union=Multiply1*Multiply2;
		DecimalFormat df=new DecimalFormat("#.00");
		return df.format(union);

	}

	@Override
	public int dividMoreOne(int dividend, int divid) 
	{
		if((dividend/10>0)&&(dividend/10<100)&&(divid>0)&&(divid<10)&&(dividend%divid==0))
		{
			return dividend/divid;
		}
		return 0;
	}

	@Override
	public int dividTwo(int dividend, int divid) 
	{
		if(dividend/10>0&&dividend/100<10&&divid/10<10&&divid/10>0&&dividend%divid==0)
		{
			return dividend/divid;
		}
		return 0;
	}

	@Override
	public String dividIntDecimal(int dividend, int divid) 
	{
		double union,Divid;
		Divid=(double)(divid/100);
		if(dividend%divid==0)
		{
		union=(double)dividend/Divid;
		DecimalFormat df=new DecimalFormat("#.00");
			return df.format(union);
		}
			return null;
	}



	@Override
	public String dividDecinmalInt(int dividend, int divid) 
	{
		double union,Dividend;
		Dividend=(double)(dividend/100);
		if(dividend%divid==0)
		{
		union=Dividend/divid;
		DecimalFormat df=new DecimalFormat("#.00");
			return df.format(union);
		}
			return null;

	}


	@Override
	public int dividTable(int dividend, int divid) 
	{
		if(dividend%divid==0)
		{
		return dividend/divid;
		}
		return 0;
	}

	@Override
	public int dividOutTable(int dividend, int divid) 
	{
		return dividend/divid;
	}

	@Override
	public int dividOutTableRemainder(int dividend, int divid) 
	{
		return dividend%divid;
	}

	@Override
	public int addMolecule(int molecule1, int denominator1, int molecule2, int denominator2) 
	{
		int denominator,molecule,maxCommen;
		denominator=minCommenMultiply(denominator1, denominator2);
		molecule=denominator/denominator1*molecule1+denominator/denominator2*molecule2;
		maxCommen=maxCommenDivisor(denominator,molecule);
		molecule=molecule/maxCommen;
		return molecule;
	}

	@Override
	public int addDenominator(int molecule1, int denominator1, int molecule2, int denominator2) 
	{
		int denominator,molecule,maxCommen;
		denominator=minCommenMultiply(denominator1, denominator2);
		molecule=denominator/denominator1*molecule1+denominator/denominator2*molecule2;
		maxCommen=maxCommenDivisor(denominator,molecule);
		denominator=denominator/maxCommen;
		return denominator;
	}

	@Override
	public int subtractionNegative(int subtract1, int subtract2) {
		return subtract1-subtract2;
	}

	@Override
	public int subtractionMolecule(int molecule1, int denominator1, int molecule2, int denominator2) 
	{
		int denominator,molecule,maxCommen;
		denominator=minCommenMultiply(denominator1, denominator2);
		molecule=denominator/denominator1*molecule1-denominator/denominator2*molecule2;
		maxCommen=maxCommenDivisor(denominator, molecule);
		molecule=molecule/maxCommen;
		return molecule;
	}

	@Override
	public int subtractionDenominator(int molecule1, int denominator1, int molecule2, int denominator2) 
	{
		int denominator,molecule,maxCommen;
		denominator=minCommenMultiply(denominator1, denominator2);
		molecule=denominator/denominator1*molecule1-denominator/denominator2*molecule2;
		maxCommen=maxCommenDivisor(denominator, molecule);
		denominator=denominator/maxCommen;
		return denominator;
	}

	@Override
	public int multiplyMolecule(int molecule1, int denominator1, int molecule2, int denominator2) 
	{
		int molecule,denominator,maxCommen;
		molecule=molecule1*molecule2;
		denominator=denominator1*denominator2;
		maxCommen=maxCommenDivisor(molecule, denominator);
		molecule=molecule/maxCommen;
		return molecule;
	}

	@Override
	public int multiplyDenominator(int molecule1, int denominator1, int molecule2, int denominator2) 
	{
		int molecule,denominator,maxCommen;
		molecule=molecule1*molecule2;
		denominator=denominator1*denominator2;
		maxCommen=maxCommenDivisor(molecule, denominator);
		denominator=denominator/maxCommen;
		return denominator;
	}

	@Override
	public int dividMolecule(int molecule1, int denominator1, int molecule2, int denominator2) 
	{
		int molecule,denominator,maxCommen;
		molecule=molecule1*denominator2;
		denominator=molecule2*denominator1;
		maxCommen=maxCommenDivisor(molecule, denominator);
		molecule=molecule/maxCommen;
		return molecule;
	}

	@Override
	public int dividDenominator(int molecule1, int denominator1, int molecule2, int denominator2) 
	{
		int molecule,denominator,maxCommen;
		molecule=molecule1*denominator2;
		denominator=molecule2*denominator1;
		maxCommen=maxCommenDivisor(molecule, denominator);
		denominator=denominator/maxCommen;
		return denominator;
	}



}
