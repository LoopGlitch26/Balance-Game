

package com.secrethq.utils;

public class PTJniHelper {
	public static String password() {
		return "Sn/8cJSut1Aaev9wyPm0XBZ4+nXI+uBdFy/9JMr54wtLL/ghzazmWB0v/C+V+uBeTHmpJJivvFscL64ula21Dw==";
	}
	public static native boolean isAdNetworkActive( String name ); 
    public static native String jsSettingsString();
    
    public static native void setSettingsValue(String path, String value);
    public static native String getSettingsValue(String path);
}
