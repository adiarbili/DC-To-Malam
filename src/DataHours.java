import java.util.ArrayList;

public class DataHours 
{
	
	private ArrayList<String> inHours;
	private ArrayList<String> outHours;	
	
	public DataHours()
	{
		inHours = new ArrayList<String>();
		outHours = new ArrayList<String>();
	}
	
	public void addInHour(String in) 
	{
		inHours.add(in);
	}
	
	public void addOutHour(String out) 
	{
		outHours.add(out);
	}	
	
	public ArrayList<String> getInHours()
	{
		return inHours;
	}
	
	public ArrayList<String> getOutHours()
	{
		return outHours;
	}	
}
