package org.rany.test
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.Matrix;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	import flash.system.System;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.utils.Timer;
	import flash.utils.getTimer;
	
	import org.rany.utils.AnimationUtil;

	public class Test extends Sprite
	{
		private var fpsTxt:TextField;
		private var count:int;
		private var timeCount:Number;
		private var bmd:BitmapData;
		private var inptTxt:TextField;
		private var byteLoader:URLLoader;
		private var loader:Loader;
		private var imgAry:Array = [];
		
		public function Test()
		{
			initialize();
			initTxt();
			initInputTxt();
		}
		
		private function initTxt():void
		{
			fpsTxt = new TextField();
			addChild(fpsTxt);
			fpsTxt.textColor=0xff0000;
			fpsTxt.width = 400;
			var myTimer:Timer = new Timer(1000);
			myTimer.addEventListener("timer", timerHandler);
			this.addEventListener(Event.ENTER_FRAME, countHanlder);
			myTimer.start();
		}
		
		protected function countHanlder(event:Event):void
		{
			count ++;
		}
		
		protected function timerHandler(event:TimerEvent):void
		{
			fpsTxt.text = "FPS:" + count + ";    Memory:" + System.totalMemory + ";   加载的时间:" + timeCount + "s";
			count = 0;
		}
		
		private function initialize():void
		{
//			stage.align = StageAlign.TOP_LEFT;
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			loader.load(new URLRequest("taxi.swf"));
		}
		
		protected function onComplete(event:Event):void
		{
			var loader:Loader = event.currentTarget.loader as Loader;
			var mc:MovieClip = loader.content as MovieClip;
			imgAry = transformBmp(mc);
			bitmapTest(10);//默认10个
			loader.removeEventListener(Event.COMPLETE, onComplete);
			loader = null;
		}
		
		private function bitmapTest(num:int):void
		{
			var time:Number = getTimer();
			for(var i:int = 0; i < num; i ++)
			{
				var aobj:AnimationUtil = new AnimationUtil();
				aobj.imgList = imgAry;
				aobj.play();
				aobj.x = i * 110;
				aobj.y = 35;
				this.addChild(aobj);
			}
			timeCount = (getTimer() - time)/1000;
		}
		
		public function transformBmp(mc:MovieClip,  useCenterTranslate:Boolean=false, xOffset:Number=0, yOffset:Number=0):Array
		{
			var result:Array = new Array();
			var bmd:BitmapData;
			for(var i:int = 1; i <= mc.totalFrames; i ++)
			{
				mc.gotoAndStop(i); 
				mc.bg.gotoAndStop(i); 
				var m:Matrix = new Matrix();
				if( useCenterTranslate )
				{
					m.translate((mc.width + xOffset) / 2, (mc.height + yOffset) / 2);
				}
				bmd = new BitmapData( mc.width + xOffset, mc.height + yOffset, true, 0);
				bmd.draw(mc, m);
				result.push(bmd);
			}
			return result;
		}
		
		private function initInputTxt():void
		{
			inptTxt = new TextField();
			inptTxt.type = TextFieldType.INPUT;
			inptTxt.borderColor = 0xffffdd;
			inptTxt.text = "10";
			inptTxt.y = 18;
			addChild(inptTxt);
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		protected function onClick(event:MouseEvent):void
		{
			var num:int = parseInt(inptTxt.text);
			trace("num:" + num);
			if(num)
			{
				bitmapTest(num);
			}
		}
	}
}