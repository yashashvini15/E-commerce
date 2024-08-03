package helper;

public class DescriptionShortner {
    public static String shortDescription(String description){
        String[] str =description.split(" ");
        if(str.length>10){
            String result = "";
            for(int i=0 ; i<10;i++){
                result = result +  str[i] +" ";
            }
            return (result+"....");
        }
        return (description+"....");
    }

    public static String shortestDescription(String description){
        String[] str =description.split(" ");
        if(str.length>4){
            String result = "";
            for(int i=0 ; i<4;i++){
                result = result +  str[i] +" ";
            }
            return (result+"....");
        }
        return (description+"....");
    }
}
