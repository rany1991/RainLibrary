package carlylee.util
{
	/**
	 * XMLUtil
	 *
	 * author: Eunjeong, Lee.(carly.l86@gmail.com).
	 * modified: Dec 10, 2013
	 */
	public class XMLUtil
	{
		/**
		 * If the XML has some garbage data in tail, 
		 * this function will get rid of XML's garbage data.
		 * And then returns normal XML, which is start and end with $rootName.
		 * @param $XML you want to trim 
		 * @param $rootName outermost node name
		 * @return XML
		 * 
		 */		
		public static function trimXMLString( $XML:String, $rootName:String ):XML{
			var resultXML:String = $XML;
			var head1:String = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><" + $rootName;
			var head2:String = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<" + $rootName;
			var tail1:String = "</" +$rootName+ ">";
			var tail2:String = "/>";
			
			var pos:int = resultXML.indexOf( head1 );
			if ((pos != -1) && (pos != 0)){ //If there is 'head1' in XML
				resultXML = resultXML.substr( pos );//cut head1. XML will be start with pure rootNode.
			}
			pos = resultXML.indexOf(head2);
			if (( pos!=-1 ) && ( pos!=0 )) {
				resultXML = resultXML.substr( pos );
			}
			
			pos = resultXML.indexOf( tail1 );//Find 'tail1' in XML
			if( pos!=-1 ){//if there is 'tail1' in XML, cut the XML data to position of 'tail1', for get rid of garbage data.
				resultXML = resultXML.substr(0, pos+tail1.length );
			}
			
			var pos2:int = resultXML.lastIndexOf( $rootName );
			if ( pos2!=-1 ) {
				pos = resultXML.indexOf( tail2, pos2 );
				if ( pos!=-1 ){
					resultXML = resultXML.substr( 0, pos+tail2.length );
				}
			}
			return new XML( resultXML );
		}
	}
}