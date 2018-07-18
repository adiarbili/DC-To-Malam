import java.io.IOException;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

public class Auto 
{

	private final String URL = "https://payroll.malam.com/Salprd5Root/faces/login.jspx?_adf.ctrl-state=124lzp9tla_11&_afrRedirect=82209905838311";
	private final String COMP = "35"; 
	private WebDriver chromeDriver;
	private WebDriverWait wait;
	private String userID;
	private String userPass;
	private  enum searchType {ID, XPATH};
		
	public Auto(String id, char[] password)
	{
		//System.setProperty("webdriver.chrome.driver", "D:\\Work-Elbit\\Selenium\\chromedriver.exe"); //Chrome
		System.setProperty("webdriver.chrome.driver", "C:\\Users\\Adi\\Desktop\\IEDriverServer.exe"); //IE
		

		//chromeDriver = new ChromeDriver();
		chromeDriver = new InternetExplorerDriver();
		chromeDriver.manage().window().maximize();
		
		wait = new WebDriverWait(chromeDriver, 10);

		chromeDriver.get(URL);
		userID = id;
		userPass  = String.copyValueOf(password);
		
		//chromeDriver.manage ().timeouts ().implicitlyWait (10, TimeUnit.SECONDS);
		

		
		loginToMalam();
	}
	
	public void loginToMalam()
	{
		String IDCompany = "indexNumInput::content";
		String IDUerID = "useridInput::content";
		String IDPass = "it2::content";
		//String IDloginBtn = "loginButton"; //Chrome
		String IDloginBtn = "loginButtonText"; //IE
		
				
		getElementByID(searchType.ID, IDCompany).sendKeys(COMP);
		getElementByID(searchType.ID, IDUerID).sendKeys(userID);
		getElementByID(searchType.ID, IDPass).sendKeys(userPass);		
		getElementByID(searchType.ID, IDloginBtn).click();
		presenceTab();
	}
	
	public void presenceTab()
	{
		//String XpathGeneralPresenceBtn = "//*[@id=\"pt1:j_id7\"]/div/table/tbody/tr/td[3]/div"; //Chrome
		String XpathGeneralPresenceBtn = "//div[@id='pt1:j_id7']"; //IE
		
		String XpathPresenceBtn = "//*[@id=\"pt1:timesheet__31410110\"]/td[2]";
		
		getElementByID(searchType.XPATH, XpathGeneralPresenceBtn).click();
		getElementByID(searchType.XPATH, XpathPresenceBtn).click();
		
		insertHours();
		
	}
	
	
	public void insertHours()
	{		
		int i;
		String hoursTableXpath = "//div[@id=\"pt1:dataTable::db\"]/table/tbody/tr",
				inTimeXpath,
				outTimeXpath,				
				inTime = "7:35",
				outTime = "18:00";
			
		List<WebElement> trList = chromeDriver.findElements(By.xpath(hoursTableXpath));
					
		//System.out.println("Size of trList: " + trList.size());
		
		for(i = 0; i < trList.size(); i++)
		{
			inTimeXpath = "//*[@id=\"pt1:dataTable:" + i + ":clockInTime::content\"]";
			outTimeXpath = "//*[@id=\"pt1:dataTable:" + i + ":clockOutTime::content\"]";
			
			WebElement inTimeElement = getElementByID(searchType.XPATH, inTimeXpath);
			((JavascriptExecutor) chromeDriver).executeScript("arguments[0].scrollIntoView(true);", inTimeElement);
			
			try 
			{
				Thread.sleep(200);
			} 
			catch (InterruptedException e) 
			{
				e.printStackTrace();
			} 
			
			inTimeElement.sendKeys(inTime);
			//getElementByID(searchType.XPATH, inTimeXpath).sendKeys(inTime);
			getElementByID(searchType.XPATH, outTimeXpath).sendKeys(outTime);
		}
		

		
		
		//terminateChormeDriverProc();
		chromeDriver.quit();
	}
	
	
	
	public WebElement getElementByID(searchType type, String componeteIdentifier)
	{
		WebElement res = null;
		
		try 
		{
			switch(type)
			{
				case ID:
					res =  wait.until(ExpectedConditions.presenceOfElementLocated(By.id(componeteIdentifier)));
					break;
				
				case XPATH:
					res =  wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath(componeteIdentifier)));
					break;					
			}
			
		} 
		catch (Exception e) 
		{
			System.out.println(componeteIdentifier + " object was not foud.");
			//alert()
		}
		
		return res;
	}
	
	public static void terminateChormeDriverProc()
	{
		try 
		{
			Runtime.getRuntime().exec("TASKKILL /F /IM chromedriver.exe");
		} 
		catch (IOException e) 
		{
			e.printStackTrace();
		}
	}

}
