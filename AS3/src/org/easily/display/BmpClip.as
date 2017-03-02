package org.easily.display
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	import org.easily.loader.LoaderUtils;
	import org.easily.ticker.FrameTicker;
	
	public class BmpClip extends Container
	{
		public var url:String;
		public var infoArr:Array;
		public var index:int;
		public var length:int;
		public var sheet:BitmapData;
		public var bmp:Bitmap;
		public var bmd:BitmapData;
		public var pt:Point;
		public var timer:uint;
		public var flag:Boolean;
		
		public function BmpClip()
		{
			super();
			
			infoArr = [];
			flag = true;
			pt = new Point;
		}
		
		public function loadRes(url_:String):void
		{
			url = url_;
			loadConf();
		}
		
		public function loadConf():void
		{
			LoaderUtils.loadText(url + ".xml", onComplete, true);
			function onComplete(text:String):void
			{
				if (flag)
				{
					var w:Number, h:Number;
					for each (var frame:XML in new XML(text)..frame)
					{
						var info:BmpInfo = new BmpInfo(Number(frame.x), Number(frame.y), Number(frame.w), Number(frame.h));
						infoArr.push(info);
						w = info.w;
						h = info.h;
					}
					
					bmd = new BitmapData(w, h, true, 0);
					bmp = new Bitmap(bmd);
					length = infoArr.length;
					loadSheet();
				}
			}
		}
		
		public function loadSheet():void
		{
			LoaderUtils.loadRes(url + ".png", onComplete, true);
			function onComplete(bmp_:Bitmap):void
			{
				if (flag)
				{
					sheet = bmp_.bitmapData;
					play();
				}
			}
		}
		
		public function play():void
		{
			stop();
			flag = true;
			if (sheet)
			{
				timer = FrameTicker.setInterval(update);
				addChild(bmp);
			}
		}
		
		public function stop():void
		{
			FrameTicker.clearInterval(timer);
			removeChild(bmp);
			flag = false;
		}
		
		public function update(dtime:Number):void
		{
			var info:BmpInfo = infoArr[index];
			index = ++index % length;
			bmd.copyPixels(sheet, info.rect, pt);
		}
		
		public override function dispose():void
		{
			//TODO Auto-generated method stub
			stop();
			for each (var info:BmpInfo in infoArr)
			{
				info.dispose();
			}
			infoArr.length = 0;
			if (bmd)
			{
				bmd.dispose();
				bmd = null;
			}
			sheet = null;
			bmp = null;
			super.dispose();
		}
	}
}