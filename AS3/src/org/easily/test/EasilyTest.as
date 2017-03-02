package org.easily.test
{
	import cmodule.encryption.CLibInit;
	
	import com.aiyou.yesguo.data.CommentBan;
	import com.aiyou.yesguo.data.ItemData;
	import com.aiyou.yesguo.data.LoadingTipsData;
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	import com.greensock.easing.Linear;
	import com.hexagonstar.util.debug.Debug;
	import com.netease.protobuf.Int64;
	import com.probertson.utils.GZIPBytesEncoder;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.filters.ColorMatrixFilter;
	import flash.filters.GlowFilter;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.net.SharedObject;
	import flash.net.SharedObjectFlushStatus;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.system.Capabilities;
	import flash.system.System;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import flash.utils.describeType;
	import flash.utils.getDefinitionByName;
	import flash.utils.getTimer;
	import flash.utils.setInterval;
	import flash.utils.setTimeout;
	
	import mx.binding.utils.BindingUtils;
	
	import org.easily.debug.Eval;
	import org.easily.debug.XPerf;
	import org.easily.display.BmpClip;
	import org.easily.display.Container;
	import org.easily.effect.TeraFire;
	import org.easily.json.JSONx;
	import org.easily.loader.LoaderUtils;
	import org.easily.test.ArrowTest;
	import org.easily.test.BindTest;
	import org.easily.test.ChineseLunisolarCalendar;
	import org.easily.test.Closure;
	import org.easily.test.ListTest;
	import org.easily.test.MinimalCompTest;
	import org.easily.test.Page1;
	import org.easily.test.SliderExTest;
	import org.easily.test.TreeCtrlTest;
	import org.easily.test.examples.AddFromArgsExample;
	import org.easily.ticker.FrameTicker;
	import org.easily.ticker.TickerUtils;
	import org.easily.ticker.TimeTicker;
	import org.easily.tween.FrameTween;
	import org.easily.tween.LinearTween;
	import org.easily.ui.load.Loading;
	import org.easily.utils.ArrayUtils;
	import org.easily.utils.ColorMatrix;
	import org.easily.utils.DictionaryUtils;
	import org.easily.utils.DomainUtils;
	import org.easily.utils.FuncProxy;
	import org.easily.utils.FunctionUtils;
	import org.easily.utils.MathUtils;
	import org.easily.utils.ObjUtils;
	import org.easily.utils.ShapeUtils;
	import org.easily.utils.StringUtils;
	import org.easily.utils.WebUtils;
	
	/**
	 * @author Easily
	 */
	[SWF(width="640", height="480", backgroundColor="0x414647")]
	dynamic public class EasilyTest extends Sprite
	{
		public static var xxx = [];
		
		//		include 'SkillConfig.as'
		public static const ATTR_EFF:String = "ui/attrEff.swf";
		public function EasilyTest()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			LoaderUtils
			TickerUtils.start();
			Debug.clear();
			
//			addChild(new TreeCtrlTest);
//			LoaderUtils;
//			Initializer.initStage(this);
//			Initializer.initContextMenu(this);
//			initView();
//			addChild(new SharedObjectExample)

//			t224(1,2,3,4);
// loaderInfo.applicationDomain
			t256()
		}
		
		public function t256():void
		{
			var b:ByteArray = new ByteArray;
			b.writeUnsignedInt(40001);
			
			b.position = 0
			var i = b.readShort();
			var i2 = b.readShort();
		}
		
		public function t255():void
		{
			var byte1:ByteArray = new ByteArray;
			var byte2:ByteArray = new ByteArray;
			var i1:uint = 4294906129;
			var i2:uint = 4369;
			
			byte1.writeShort(i1);
			byte2.writeShort(i2);
			
			byte1.position = 0;
			byte2.position = 0;
			
			i1 = byte1.readShort();
			i2 = byte2.readShort();
			
			
			trace(byte1.toString())
			trace(byte2.toString())
		}
		
		public function t254():void
		{
			var aa = Math.PI / 4  
			
			var matrix:Matrix = new Matrix;
			matrix.rotate(MathUtils.a2r(90));
			//			matrix.translate()
			//			matrix.rotate(aa);
			
			var pt:Point = new Point(1, 0);
			var pt2:Point = matrix.transformPoint(pt);
			pt2.x = Math.round(pt2.x)
			pt2.y = Math.round(pt2.y)
			trace(pt2)
			
			var xx:Number = Math.sqrt(Math.pow(pt2.x, 2) + Math.pow(pt2.y, 2))
			
			var yy = Math.asin(0.7071067811865476)
			var ii = Math.cos(Math.PI / 3)  
		}
		
		public function t253():void
		{
			addChild(new ArrowTest)
			return
			
			var str = "w123";
			trace(int(str))
			var dic = new Dictionary;
			dic[1] = 100;
			dic[2] = 200;
			
			delete dic[1]
			
			for each (var obj in dic)
			{
				trace()
			}
		}
		
		public function t252():void
		{
			LoaderUtils.loadRes("assets/4026.swf", function(res)
			{
				var cls = res.loaderInfo.applicationDomain.getDefinition("eff4026_target")
				var mc = new cls;
				addChild(mc)
			})
		}
		
		public function t251():void
		{
			FrameTicker.setInterval(function(dtime)
			{
				var sp = new Sprite;
				TweenLite.to(sp, 1, {x:100,y:100,onComplete:xxx})
			})
			var i = 0
			function xxx()
			{
				trace(i++)
			}
		}
		
		public function t250():void
		{
			var str:String = "https://www.google.com"
			str = str.replace(new RegExp("^https?://"), "")
			
			var host = "32132138219380219"
			if (!host.match("https?\:\/\/"))
			{
				host = "http://" + host;
			}
			
			var list = [1,2,3,4]
			var list2 = percentlist(1,2,3,90)
			//			var list2 = extendlist(list, 20)
			//			Debug.trace("hello world")
			
			forEachN([1,2,3],[2,3,4],[3,4,5],[5,6,8],function(a,s,f,g){
				trace(a,s,f,g)
			})
			
			function forEachN(...args)
			{
				var func = args[args.length - 1]
				var len = args.length - 1
				var arrlist = args.slice(0, len)
				var len2 = arrlist[0].length
				for (var i=0; i<len2; i++)
				{
					var list = []
					for each (var arr in arrlist)
					{
						list.push(arr[i])
					}
					func.apply(null, list)
				}
			}
			
			
			function percentlist(...args)
			{
				var list = []
				var sum = listsum(args)
				var total = 0
				for each (var i in args)
				{
					var per = i / sum
					total += per
					list.push(per)
				}
				list[list.length - 1] += 1 - total
				return list
			}
			
			function listsum(list)
			{
				var num = 0
				for each (var i in list)
				{
					num += i
				}
				return num
			}
			
			function extendlist(list, len)
			{
				var index = 0
				var len2 = list.length
				var list2 = []
				for (var i=0; i<len; i++)
				{
					list2.push(list[index++])
					index %= len2
				}
				return list2
			}
		}
		
		public function t248():void
		{
			var obj = {
				x:100,
				f1:function()
				{
					trace(this.x)
				}
			}
			var obj2 = {
				x:200,
				f2:function()
				{
					//					obj.f1.apply(null)
					var f1 = obj.f1;
					f1()
				}
			}
			obj2.f2()
		}
		
		public function t247():void
		{
			var obj = {};
			if (obj.x == undefined)
			{
				trace("ddd")
			}
			var obj2 = {};
			obj2.a = obj.a
			if (obj2.hasOwnProperty("a"))
			{
				trace("xxx")
			}
			
			//			class fjdsklafjdsklfjdskl
			//			{
			//
			//			}
			//			addChild(new AddFromArgsExample)
		}
		
		public function t246():void
		{
			var skillConfig = "[{\"effFrames\":[100,90,80,80,80,80,80,80,50,80,0],\"firePoint\":{\"y\":0,\"x\":0},\"effDelay\":100,\"effPath\":\"D:\\My Documents\\Flash Builder 4.5\\game\\res\\effect2\\1053.swf\",\"skillId\":1053,\"effName\":\"1053.swf\",\"animatType\":12,\"hitDelay\":0},{\"effFrames\":[80,80,80,0,0],\"firePoint\":{\"y\":-81,\"x\":109},\"effDelay\":380,\"effPath\":\"D:\\My Documents\\Flash Builder 4.5\\game\\res\\effect2\\1050.swf\",\"skillId\":1050,\"effName\":\"1050.swf\",\"animatType\":13,\"hitDelay\":0},{\"effFrames\":[100,100,100,100,100,100,100,0],\"firePoint\":{\"y\":0,\"x\":0},\"effDelay\":50,\"effPath\":\"D:\\My Documents\\Flash Builder 4.5\\game\\res\\effect2\\1052.swf\",\"skillId\":1052,\"effName\":\"1052.swf\",\"animatType\":5,\"hitDelay\":0},{\"effFrames\":[70,70,70,70,70,70,0],\"firePoint\":{\"y\":0,\"x\":0},\"effDelay\":200,\"effPath\":\"D:\\My Documents\\Flash Builder 4.5\\game\\res\\effect2\\1055.swf\",\"skillId\":1055,\"effName\":\"1055.swf\",\"animatType\":5,\"hitDelay\":0},{\"effFrames\":[70,70,70,70,70,70,0],\"firePoint\":{\"y\":0,\"x\":0},\"effDelay\":100,\"effPath\":\"D:\\My Documents\\Flash Builder 4.5\\game\\res\\effect2\\1058.swf\",\"skillId\":1058,\"effName\":\"1058.swf\",\"animatType\":5,\"hitDelay\":0},{\"effFrames\":[],\"firePoint\":{\"y\":-77,\"x\":48},\"effDelay\":200,\"effPath\":\"D:\\My Documents\\Flash Builder 4.5\\game\\res\\effect2\\2050.swf\",\"skillId\":2050,\"effName\":\"2050.swf\",\"animatType\":4,\"hitDelay\":0},{\"effFrames\":[100,100,100,100,0],\"firePoint\":{\"y\":-111,\"x\":207},\"effDelay\":500,\"effPath\":\"D:\\My Documents\\Flash Builder 4.5\\game\\res\\effect2\\2053.swf\",\"skillId\":2053,\"effName\":\"2053.swf\",\"animatType\":13,\"hitDelay\":0},{\"effFrames\":[40,40,40,40,40,40,40,40,40,40,40,40,0],\"firePoint\":{\"y\":-89,\"x\":125},\"effDelay\":100,\"effPath\":\"D:\\My Documents\\Flash Builder 4.5\\game\\res\\effect2\\2054.swf\",\"skillId\":2054,\"effName\":\"2054.swf\",\"animatType\":13,\"hitDelay\":0}]"
			var configMap = new Dictionary
			var jsonObj = JSONx.decode(skillConfig)
			for each (var item_ in jsonObj)
			{
				trace(ObjUtils.toString(item_))
				configMap[item_.skillId] = item_
			}
		}
		
		public function t245():void
		{
			var obj = {
				xx:100,
				100:123,
				func:function()
				{
					trace(this.xx)
					trace("hello world!!!")
					var obj2 = {
						xx:321,
						func:function()
						{
							trace(this.xx)
						}
					}
					obj2.func()
				}
			}
			trace(obj)
			obj.func()
			return
			addChild(new ListTest)
		}
		
		public function t244():void
		{
			//			var obj = {};
			//			obj.eff1 = obj.eff2 ||= "";
			//			addChild(new TeraFire)
			addChild(new BindTest)
		}
		
		public function t243():void
		{
			var arr = [2,3,4,9,7,4,2];
			arr.sort(Array.NUMERIC)
			
			
			var pt1 = new Point(1,1);
			var pt2 = new Point(2,2);
			var angle = MathUtils.angle(pt1.x,pt1.y,pt2.x,pt2.y);
			var r = Math.atan2(pt2.y-pt1.y, pt2.x-pt1.x);
			r = r + Math.PI/4;
			var x_:Number = Math.cos(r) * 10 + pt1.x;
			var y_:Number = Math.sin(r) * 10 + pt1.y;
			
			
		}
		
		public function t242():void
		{
			addChild(new SliderExTest);
		}
		
		public function t241():void
		{
			var arr = [3,2,4,0,5,6,1,9,8,7];
			function func(i1,i2)
			{
				return i1 < i2
			}
			ArrayUtils.quickSort(arr,func)
			
		}
		
		public function t240():void
		{
			addChild(new MinimalCompTest)
			return
			
			var txt = new TextField;
			var xml = describeType(txt)
		}
		
		public function t239():void
		{
			var dic = new Dictionary;
			dic[123] = 123;
			dic[1234] = 1234;
			
			DictionaryUtils.dispose(dic);
		}
		
		public function t238():void
		{
			var obj1 = SharedObject.getLocal("data.swf");
			var obj2 = SharedObject.getLocal("data2.swf");
			trace(obj1.data.version)
			trace(obj2.data.version)
		}
		
		public function t237():void
		{
			var loading = new Loading
			loading.x = loading.x = 100
			addChild(loading)
		}
		
		public function t236():void
		{
			var n = 1000
			var dict = new Dictionary;
			TimeTicker.setInterval(100,function()
			{
				for (var i:int = 0; i < n; i++)
				{
					dict[i.toString()] = new Sprite;
				}
				for (var j:int = 0; j < n; j++)
				{
					dict[j.toString()] = null;
				}
			})
		}
		
		function getInstance(s)
		{
			return DomainUtils.getInstance(s)
		}
		
		public function t235():void
		{
			addChild(new TreeCtrlTest);
		}
		
		public function t234():void
		{
			var o1 = {}
			trace(o1.a)
			o1 = {a:1}
			
			trace(o1.a)
			
			delete o1.a
			
			trace(o1.a)
			var o = {a:"1", b:"2", c:"3"}
			for (var s in o)
			{
				delete o[s]
			}
			
			
			
			function test1(p1:int, p2:int)
			{
				trace(arguments.length)
				trace(arguments)
			}
			
			function test2(p1:int, p2:int = 400)
			{
				trace(arguments.length)
				trace(arguments)
			}
			
			test1(100,200)
			test2(300)
			
			var list = []
			function tf1(p)
			{
				list.push(arguments)
			}
			function tf2(p)
			{
				list.push(arguments)
			}
			function tf3(p)
			{
				list.push(arguments)
			}
			tf1(100)
			tf2(200)
			tf3(300)
			
			trace(list)
		}
		
		public function t233():void
		{
			var r = "http[s]?\:\/\/";
			
			var s = "http://www.g.cn";
			var s2 = "https://www.g.cn";
			var s3 = "htttps://www.g.cn";
			var s4 = "www.g.cn";
			
			trace(s.match(r));
			trace(s2.match(r));
			trace(s3.match(r));
			trace(s4.match(r));
			
			if (!s4.match(r))
			{
				s4 = "http://" + s4;
			}
			
			var btn:SimpleButton;
			
			var xp = 200
			var yp = 200
			var offset = 30
			for (var i:int = 0; i < 5; i++)
			{
				var x_ = xp + MathUtils.randBound(offset)
				var y_ = yp + MathUtils.randBound(offset)
				bombEff(x_, y_, 0.8, 0.5, 400)
			}
			
			function bombEff(x_, y_, t1, t2, h1)
			{
				var s = arguments
				var a = arguments.concat()
				LoaderUtils.loadDomain("F:/My Documents/SVN/client/res/effect/BombEff.swf", function(...args)
				{
					var mc1 = getInstance("com.aiyou.yesguo.borderwar.scene.BwBomb01Mc")
					addChild(mc1)
					mc1.x = x_
					mc1.y = y_
					
					TweenLite.to(mc1, 1, {y:mc1.y + h1, onComplete:onComplete, ease:Linear.easeNone})
					function onComplete()
					{
						TweenLite.to(mc1, t2, {alpha:0})
						var mc2 = getInstance("com.aiyou.yesguo.borderwar.scene.BwBomb02Mc")
						addChild(mc2)
						mc2.x = mc1.x
						mc2.y = mc1.y
					}
				})
				
			}
		}
		
		public function t232():void
		{
			for (var i=0;i<100;i++)
				FrameTicker.setInterval(t231)
		}
		
		public function t231(...p):void
		{
			LoaderUtils.loadRes("D:/My Documents/Material/earth.jpg", onComplete);
			function onComplete(bmp:Bitmap):void
			{
				trace("xxx");
			}
		}
		
		private function t230():void
		{
			LoaderUtils.loadDomain("F:\My Documents\SVN\client\res\effect\BombEff.swf", function(...args)
			{
				var mc = DomainUtils.getInstance("com.aiyou.yesguo.borderwar.scene.BwUnitHpMc");
				addChild(mc)
				mc.x = mc.y = 200
				setInterval(timer, 50);
				var i = -1
				function timer(...args)
				{
					i = ++i % 100
					var v = 100 - i
					//					trace(v)
					mc.setPercent(v, 100, 5)
				}
			})
		}
		
		public function t229():void
		{
			var str = StringUtils.printf("1:%89s", "xxx")
			trace(str)
			trace(str.length)
		}
		
		public function t228():void
		{
			var p = {x:1,y:2}
			var mx = new Matrix;
			mx.translate(p.x, p.y)
			mx.rotate(MathUtils.a2r(180))
			Debug.trace(mx.a, mx.b, mx.c, mx.d, mx.tx, mx.ty)
			p.x = Math.round(mx.tx)
			p.y = Math.round(mx.ty)
			Debug.trace(mx.toString())
		}
		
		private function t227():void
		{
			Debug.trace("test");
			Debug.trace(filterComment("我们很好玩啊平台"))
			Debug.trace(filterComment("送妹子"))
		}
		
		public static var filterList:Array;
		
		public static function filterComment(str:String):String
		{
			filterList ||= CommentBan.data[1].commentBan.split(",");
			for each (var word:String in filterList)
			{
				if (str.indexOf(word) != -1)
				{
					str = str.replace(word, "*");
				}
			}
			return str;
		}
		
		private function getStar():void
		{
			
		}
		
		private function t226():void
		{
			var pt1 = {x:2}
			var pt2 = {x:4}
			var pt3 = {x:1}
			var arr = [pt1, pt2, pt3]
			arr.sortOn("x")
			
			var ba:ByteArray = new ByteArray;
			ba.writeUTF("123789543");
			ba.position = 0;
			var a = ba[2]
			
			var list = []
			for (var i=0; i<300000; i++)
			{
				list.push(new Sprite)
			}
			var test:Vector.<uint> = new Vector.<uint>(322322430,true);
			trace(System.totalMemory)
		}
		
		private function t224(...args):void
		{
			var e=  (new Error()).getStackTrace()
			var s = (new Error()).getStackTrace().split("/")[1].split("(")[0]
			t225.apply(null, args)
		}
		
		private function t225(x,y,z,a):void
		{
			trace(x,y,z,a)
		}
		
		public function t223(...args):void
		{
			try
			{
				var i = 100
			}
			catch (e:Error)
			{
				
			}
			finally
			{
				trace(i)
			}
		}
		
		private function t222():void
		{
			try
			{
				
				Page1.xx
			}
			catch(error:Error)
			{
				
			}
		}
		
		public static function adjustHue(displayObject:DisplayObject, value:Number):void
		{
			var filter:ColorMatrix = new ColorMatrix();
			filter.adjustHue(value);
			displayObject.filters = [new ColorMatrixFilter(filter)];
		}
		
		private function t221():void
		{
			LoaderUtils.loadDomain("2050.swf", function(data)
			{
				var xxx = DomainUtils.getInstance("com.aiyou.yesguo.fight.effect.Eff2050_10")
				addChild(xxx)
				xxx.x = xxx.y = 300
				
				var textfield:TextField = new TextField;
				textfield.type = TextFieldType.INPUT;
				textfield.text = "180"
				addChild(textfield)
				textfield.border = true
				textfield.x = textfield.y = 500
				TimeTicker.setInterval(500,onInput)
				function onInput():void
				{
					adjustHue(xxx, int(textfield.text))
				}
			})
			
		}
		
		private function t220():void
		{
			var arr:Array = [1,2,3]
			var i = [2,100,200]
			
			MathUtils.insertList(arr, i,4)
		}
		
		private function t219():void
		{
			var o = {a:222, b:33}
			for (var key in o)
			{
				trace(key, o[key])
			}
			
			var arr = [1,2,3,-1]
			var arr2 = []
			
			function aaa(e,i,a)
			{
				return e>0
			}
			
			trace(arr.every(aaa))
			trace(arr2.every(aaa))
		}
		
		private function t218():void
		{
			var time = getTimer()
			TimeTicker.setInterval(500, function()
			{
				trace("TimeTicker:"+(getTimer()-time));
			})
			TweenLite.delayedCall(0.5,onTimeout);
			function onTimeout()
			{
				trace("TweenLite:"+(getTimer()-time));
				TweenLite.delayedCall(0.5,onTimeout);
			}
		}
		
		private function t217():void
		{
			var data = ItemData.data[170101]
		}
		
		private function t216():void
		{
			var arr = [{x:100},{y:200},{z:300}]
			var o = JSONx.encode(arr)
		}
		
		private function t215():void
		{
			var mc = new testmc000;
			addChild(mc)
			
			mc.xx.mouseEnabled = false
			var txt = mc.txt
			txt.addEventListener(FocusEvent.FOCUS_IN, onFocusIn);
			txt.addEventListener(FocusEvent.FOCUS_OUT, onFocusOut);
			
			function onFocusOut(event:FocusEvent):void
			{
				if (!txt.text)
					mc.xx.visible = true
				trace()
			}
			
			function onFocusIn(event:FocusEvent):void
			{
				mc.xx.visible = false
			}
		}
		
		private function t214():void
		{
			//			var text:TextField = new TextField;
			//			text.wordWrap
			//
			//			var colorpicker:ColorPicker = new ColorPicker();
			//			addChild(colorpicker);
			//			colorpicker.x =54;
			//			colorpicker.y = 22;
			//			colorpicker.value=0xccccff;//初始颜色，可以不设置
		}
		
		public static function toString2(obj:Object, sep:String = ","):String
		{
			var str:String = "";
			var list:Array = getKeys(obj);
			var len:int = list.length;
			var last:int = len - 1;
			for (var i:int = 0; i < len; i++)
			{
				var key:Object = list[i];
				str += key + "=" + obj[key];
				if (i < last)
				{
					str += sep;
				}
			}
			return str;
		}
		
		public static function getKeys(obj:Object):Array
		{
			var list:Array = [];
			for (var key:Object in obj)
			{
				list.push(key);
			}
			return list;
		}
		
		private function t213():void
		{
			var obj = {xx:1, xx2:300, xx3:"kw"}
			var str = toString2(obj)
			
			return
			var ba:ByteArray = new ByteArray;
			ba.writeByte(100);
			ba.position = 0;
			
			var loader:Loader = new Loader;
			loader.addEventListener(IOErrorEvent.IO_ERROR, onerr);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, errrr);
			loader.loadBytes(ba);
			return
			var date = new Date(1367916254000);
			
			var str = "http://192.168.22.239/v?uid=2";
			var reg = /uid=(\d*)/g;
			var obj = reg.exec(str)
			
			var so:SharedObject = SharedObject.getLocal("fight/fightScript.swf", '/');
			so.data.version = 0;
			so.data.bytes = new ByteArray;
		}
		
		private function errrr(event:IOErrorEvent):void
		{
			trace("zzzzzzzzzzzz")
		}
		
		private function onerr(event:IOErrorEvent):void
		{
			trace("xxxxxxxxxx")
		}
		
		public static function WebAPI(url:String, compFunc:Function):void
		{
			var request:URLRequest = new URLRequest(url);
			var loader:URLLoader=new URLLoader();
			loader.addEventListener(Event.COMPLETE, listenerFunc);
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, listenerFunc);
			loader.addEventListener(IOErrorEvent.IO_ERROR, listenerFunc);
			function listenerFunc(e:Event = null):void
			{
				loader.removeEventListener(Event.COMPLETE, listenerFunc);
				loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, listenerFunc);
				loader.removeEventListener(IOErrorEvent.IO_ERROR, listenerFunc);
				compFunc(loader);
			}
			try
			{
				loader.load(request);
			}
			catch(error:Error)
			{
				listenerFunc();
			}
		}
		
		private function t212():void
		{
			var xx = true//CONFIG::xxx
			
			var url:String = null
			url = "http://192.168.22.239/videosrv?seed=739&func=requestComments&uid=82";
			//			url = "http://192.168.22.239:16438/shareVideo?watch=80&author=易立&rid=10&version=100&agent=4399&idenfity=1&ip=sjsg1.me4399.com&resdomain=sjsg-cdnres.me4399.com&crypted=1&title=快来看啊！屌爆了！&filepath=2013422/sjsg_82878_4295002575_398308574_101.jpg";
			//			url = "http://192.168.22.239:16438/getVideos?from=1&to=10";
			//			url = "http://192.168.22.239:16438/addComment?author=立哥&text=屌爆了&uid=2";
			WebAPI(url, onComplete)
			function onComplete(loader:Object):void
			{
				trace(loader.data);
				var obj = JSONx.decode(loader.data);
			}
		}
		
		private function t211():void
		{
			var ver = Capabilities.version.split(' ')
		}
		
		private function t210():void
		{
			var w:Number = 15;
			
			var sp:Sprite = new Sprite;
			sp.graphics.lineStyle(1,0xEFBF43);
			sp.graphics.beginFill(0xffffff);
			sp.graphics.drawCircle(w,w,w);
			sp.graphics.endFill();
			addChild(sp);
			
			FrameTicker.setIntervalEx(function()
			{
				sp.x = mouseX;
				sp.y = mouseY;
			})
		}
		
		private function t209():void
		{
			LoaderUtils.loadRes('pm.jpg',function(bmp:Bitmap)
			{
				var bmd:BitmapData = bmp.bitmapData;
				addChild(bmp);
				
				var bytes:ByteArray = bmd.getPixels(bmd.rect);
				bytes.compress();
				bytes.position = 0;
				
				bytes.uncompress();
				var bmd2:BitmapData = new BitmapData(bmd.width,bmd.height,true,0)
				bmd2.setPixels(bmd2.rect, bytes);
				
				var bmp2:Bitmap = new Bitmap(bmd2);
				addChild(bmp2);
				bmp2.x = 400
			})
		}
		
		private function t208():void
		{
			var str = (<![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Microsoft YaHei" SIZE="12" COLOR="#FFFF00" LETTERSPACING="0" KERNING="0">您的账号已经被纳入防沉迷系统，请您到<FONT COLOR="#66FF00">官网完善防沉迷信息</FONT>或<FONT COLOR="#66FF00">下线休息5小时</FONT>后，重新畅玩<FONT COLOR="#66FF00">史诗大作《神将三国》</FONT></FONT></P></TEXTFORMAT>]]> ).toString();
			var txt:TextField = new TextField;
			addChild(txt);
			txt.selectable = false;
			txt.mouseEnabled = false;
			txt.htmlText = str;
			txt.multiline = true;
			txt.wordWrap = true;
		}
		
		private function t207():void
		{
			var str:String = (<![CDATA[

trace(this)
class ttt
{
	function ttt()
	{
		trace('ttt')
	}
}

new ttt
function f()
{
	trace("heihei")
}
f()

			]]> ).toString();
		}
		
		private function t206():void
		{
			var obj:Object = {x:0}
			TweenLite.to(obj, 1, {x:-100});
			TweenLite.to(obj, 1, {x:100});
			FrameTicker.setInterval(function(d)
			{
				trace(obj.x)
			})
		}
		
		private function t205():void
		{
			FrameTicker.setInterval(function(...rest)
			{
				var so = SharedObject.getLocal('easily/test');
				so.flush();
				so.close()
			})
			
		}
		
		private function t204():void
		{
			
			
			LoaderUtils.loadBinary('test.rar',function(ba)
			{
				var so = SharedObject.getLocal('easily/test');
				//				so.flush(10000000000000000000)
				so.data.ba = ba;
				so.close()
				
			})
		}
		
		public function t203():void
		{
			try
			{
				var so:SharedObject = SharedObject.getLocal('test', '/');
				so.data['test'] = 10000000000;
				var flushStatus:String = so.flush(10000000000);
				switch (flushStatus) {
					case SharedObjectFlushStatus.PENDING:
						trace("Requesting permission to save object...");
						so.addEventListener(NetStatusEvent.NET_STATUS, onFlushStatus);
						break;
					case SharedObjectFlushStatus.FLUSHED:
						trace("Value flushed to disk.");
						break;
				}
				function onFlushStatus(event:NetStatusEvent):void {
					trace("User closed permission dialog...");
					switch (event.info.code) {
						case "SharedObject.Flush.Success":
							trace("User granted permission -- value saved.\n");
							break;
						case "SharedObject.Flush.Failed":
							trace("User denied permission -- value not saved.\n");
							break;
					}
					
					so.removeEventListener(NetStatusEvent.NET_STATUS, onFlushStatus);
				}
			}
			catch(error:Error)
			{
				trace("Error...Could not write SharedObject to disk");
			}
		}
		
		private function t202():void
		{
			var interval:Number = 1000;
			var precision:Number = 200;
			
			var lastTime1:Number = getTimer();
			var lastTime2:Number = (new Date).time;
			var timer:int = TimeTicker.setInterval(interval, onUpdate);
			function onUpdate():void
			{
				var time1:Number = getTimer();
				var time2:Number = (new Date).time;
				
				var dtime1:Number = time1 - lastTime1;
				var dtime2:Number = time2 - lastTime2;
				
				trace('lastTime1='+lastTime1+',time1='+time1+',dtime1='+dtime1);
				trace('lastTime2='+lastTime2+',time2='+time2+',dtime2='+dtime2);
				var dtime:Number = Math.abs(dtime1 - dtime2);
				trace('dtime='+dtime);
				if (dtime > precision)
				{
					trace('error !!!');
				}
				else
				{
					lastTime1 = time1;
					lastTime2 = time2;
				}
			}
		}
		
		private function t201():void
		{
			FrameTicker.setInterval(function(d)
			{
				//				trace('s='+getTimer())
				for (var i:int = 0; i < 1000; i++)
				{
					addChild(new Sprite)
					removeChildAt(0)
				}
				//				trace('e='+getTimer())
			})
			//				var i=0
			//			TimeTicker.setInterval(1000,function()
			//			{
			//				trace('i='+(++i)+' t='+getTimer())
			//			})
		}
		
		/**
		 * 初始化界面
		 */
		
		private function initView() : void {
			
			//			var url : String = "2052.swf";
			//			var loader : Loader = new Loader();
			//			var request : URLRequest = new URLRequest(url);
			//			loader.load(request);
			//			var loaderTip : LoaderTip = new LoaderTip(loader, this);
			//			loaderTip.addEventListener(LoaderTip.LOAD_COMPLETE, completeHandler);
			//			addChild(loaderTip);
		}
		
		/**
		 * 定义PBLoader对象事件处理函数
		 */
		
		private function completeHandler(event : Event) : void {
			
			//			var loaderTip : LoaderTip = event.target as LoaderTip;
			//			var bm : Bitmap = loaderTip.loader.contentLoaderInfo.content as Bitmap;
			//			addChild(bm);
		}
		
		private function t77():void
		{
			LoaderUtils.loadDomain("x.swf",function(x)
			{
				var mc = DomainUtils.getInstance("TTTT")
				addChild(mc)
				mc.x = mc.y = 400
			})
		}
		
		private function t76():void
		{
			var t:int = (new Date).time
			var t2:uint = (new Date).time
			var t3:Number= (new Date).time
		}
		
		private function t75():void
		{
			var str = "人吸办肿7849302439lkfdjgfda&s;';'hmbf,./,";
			var s = encodeURI(str)
			var s2 = encodeURIComponent(str)
			
		}
		
		public function t74():void
		{
			var ba:ByteArray = new ByteArray;
			ba.writeInt(1);
			ba.writeInt(1);
			ba.writeInt(1);
			ba.writeInt(1);
			ba.position = 0;
			
			var v:ByteArray = new ByteArray;
			ba.readBytes(v,0,12);
			
			v = new ByteArray;
			ba.readBytes(v,v.length)
		}
		
		private function t73():void
		{
			for (var i:int = 0; i < 100; i++)
			{
				trace(MathUtils.randNumber(-100,100)+",")
			}
			
		}
		
		private function t72():void
		{
			for (var i:int = 0; i < 1000; i++)
			{
				var xx = new BmpClip;
				xx.loadRes("F:/My Documents/SVN/client/res/spritesheet/fighting");
				addChild(xx)
				xx.x = MathUtils.randNumber(50,1000)
				xx.y = MathUtils.randNumber(50,600)
				//				TimeTicker.setTimeout(5000,xx.dispose)
			}
			
		}
		
		public function t71():void
		{
			LoaderUtils.loadRes("xxxx",function(xx)
			{
				trace(xx)
				addChild(xx)
			})
		}
		
		private function t301():void
		{
			LoaderUtils.loadDomain("xx.swf",function(o)
			{
				var sp = new Sprite
				var mc:MovieClip = DomainUtils.getInstance("com.aiyou.yesguo.ui.commonFile.FightingMc");
				for (var i:int = 1; i < mc.totalFrames; i++)
				{
					mc.gotoAndStop(i)
					var x_ = mc.getBounds(sp)
				}
			})
		}
		
		public function t69():void
		{
			var s = new Sprite;
			
			addEventListener(Event.ADDED,onadd);
			function onadd(e)
			{
				trace("")
			}
			
			addChild(s)
			
			var cl = new Closure(1,2,3,4);
		}
		
		private function t68():void
		{
			var con = new Container;
			FunctionUtils.call(con.xxx);
			FunctionUtils.call(con.removeAll);
		}
		
		private function t67():void
		{
			var bar = new Loading;
			bar.x = bar.y = 100
			addChild(bar)
		}
		
		public function t66():void
		{
			var str="/data/video/2013121/sjsg_0_4294968028_1546187478.jpg";
			var reg=/[\w\d_]*?\.jpg/;
			var rs = reg.exec(str);
			var arr = str.split("_")
		}
		
		public function t65():void
		{
			var arr = [];
			for (var i:int = 0; i < 10; ++i)
			{
				arr.push(fff)
				function fff():void
				{
					trace(i);
				}
			}
			for each (var f in arr)
			{
				f()
			}
		}
		
		public function t64():void
		{
			LoaderUtils.loadBinary("sjsg_4294967301_168238695.vdo", onComplete);
			function onComplete(byte:*):void
			{
				readChar(byte);
				var fileversion = readInt(byte);
				var res_version = readInt(byte);
				var player_rid = readInt64(byte);
				var player_name = readUTF(byte);
				var player_sex = readInt(byte);
				var player_jobid = readInt(byte);
				var param1 = readInt(byte);
				var param2 = readInt(byte);
				var id = readInt(byte);
				var key = readInt(byte);
				var eid = readInt(byte);
				var battletype = readInt(byte);
				var param = readInt(byte);
				var delay = readInt(byte);
			}
			
			function readChar(byte:ByteArray):String
			{
				return byte.readMultiByte(1,"utf-8");
			}
			function readString(byte:ByteArray):String
			{
				var string:String = "";
				var char:String = readChar(byte);
				while (char != "|")
				{
					string += char;
					char = readChar(byte);
				}
				return string;
			}
			function readUTF(byte:ByteArray):String
			{
				var string:String = readString(byte);
				byte.position -= string.length + 1;
				var utf8:String = byte.readUTFBytes(string.length);
				readChar(byte);
				return utf8;
			}
			function readPacket(byte:ByteArray):String
			{
				var string:String = readString(byte);
				byte.position -= string.length + 1;
				var utf8:String = byte.readUTFBytes(string.length);
				readChar(byte);
				return utf8;
			}
			function readInt(byte:ByteArray):int
			{
				return int(readString(byte));
			}
			function readInt64(byte:ByteArray):Int64
			{
				var string:String = readString(byte);
				return Int64.parseInt64(string, 10);
			}
		}
		
		public function t63():void
		{
			LoaderUtils.loadBinary("aaaaa.gz", function(bin:ByteArray)
			{
				//bin.uncompress("zlib");
				var encode:GZIPBytesEncoder = new GZIPBytesEncoder;
				var bytes:ByteArray = encode.uncompressToByteArray(bin);
				var xx = bytes.readMultiByte(bytes.length, "us-ascii")
			})
		}
		
		public function t62():void
		{
			var arr:Array = [1,2,3]
			arr.splice(3,0,4)
		}
		
		public function t61():void
		{
			var url:String = "4011.swf";
			
			var so:SharedObject = SharedObject.getLocal("xxx");
			var data:Object = so.data;
			if (data[url])
			{
				LoaderUtils.loadBytes(data[url], bytesLoaded);
			}
			else
			{
				LoaderUtils.loadBinary(url, onComplete);
				function onComplete(bytes:ByteArray):void
				{
					data[url] = bytes;
					LoaderUtils.loadBytes(bytes, bytesLoaded);
				}
			}
			
			function bytesLoaded(content:*):void
			{
				addChild(content);
			}
		}
		
		public function t60():void
		{
			var reg:RegExp = /(.*?)(\..*?$)/;
			var obj = reg.exec(ATTR_EFF)
		}
		
		public function t59():void
		{
			var a = {f:function()
			{
				trace(1)
			}}
			var b = {f:function()
			{
				trace(2)
			}}
			with(a)
			{
				f();
			}
		}
		
		public function f():void
		{
			
			trace(0)
		}
		
		public function t58():void
		{
			var sp:Sprite = new Sprite;
			sp.graphics.beginFill(0xff0000);
			sp.graphics.drawCircle(0, 0, 100);
			sp.graphics.endFill();
			addChild(sp);
			
			var bmd:BitmapData = new BitmapData(1000, 1000, true, 0);
			bmd.draw(sp);
			var bmp:Bitmap = new Bitmap(bmd);
			addChild(bmp);
			bmp.x = bmp.y = 200;
		}
		
		
		public var haha = null
		public function t57():void
		{
			
			var a = 0 / 0.0
			x = y = 200
			addChild(new TeraFire);
			return
			
			var str:String = (<![CDATA[

trace(this)
class ttt
{
	function ttt()
	{
		trace('ttt')
	}
}

new ttt
function f()
{
	trace("heihei")
}
f()

			]]> ).toString();
			var obj = {}
			Eval.eval(str);
			//			obj.f();
		}
		
		public function t56():void
		{
			var arr = []
			FrameTicker.setInterval(f)
			function f(d)
			{
				if (arr.length > 100) arr.length = 0
				arr.push(new Sprite)
			}
		}
		
		public function t54():void
		{
			var proxy = new FuncProxy(null, this.t55);
			proxy.call();
		}
		
		
		public function t55():void
		{
			haha = "123"
		}
		
		public function t53():void
		{
			var sp = new Sprite;
			sp.x = 200;
			sp.y = 200;
			addChild(sp);
			LoaderUtils.loadRes("4011.swf", onComplete);
			function onComplete(obj):void
			{
				obj = obj.getChildAt(0)
				sp.addChild(obj);
				obj.scaleY = -1
				obj.rotation = MathUtils.angle(0, 0, -10, -10);
			}
		}
		
		public function t52():void
		{
			LoaderUtils.loadDomain("ver.swf", onComplete);
			function onComplete(obj:*):void
			{
				var cls = Class(getDefinitionByName("com.aiyou.yesguo.game.Version"));
			}
		}
		
		public function t51():void
		{
			var arr = []
			for (var i:int = 0; i < 10; i++)
			{
				arr.push(f)
				function f()
				{
					trace("haha")
				}
			}
			for (var j:int = 0; j < 10; j++)
			{
				var f1 = function()
				{
					trace("heihei")
				}
				arr.push(f1)
			}
			for each (var ff in arr)
			{
				ff()
			}
			arr.length = 0;
		}
		
		public function t50():void
		{
			LoaderUtils.loadDomain("ver.swf", onComplete);
			function onComplete(obj:*):void
			{
				var cls = Class(getDefinitionByName("com.aiyou.yesguo.game.Version"));
			}
		}
		
		public function t49():void
		{
			var gameLoader:* = this;
			var alchemyLib:CLibInit = new CLibInit;
			var alchemyObj:Object = alchemyLib.init();
			
			LoaderUtils.loadBinary("2052.swf", onComplete);
			function onComplete(bytes:ByteArray):void
			{
				alchemyObj.loadBytes(gameLoader, bytes);
				return;
				
				LoaderUtils.loadBytes(bytes, onComplete2);
				function onComplete2(obj:*):void
				{
					addChild(obj);
				}
			}
		}
		
		override public function addChild(child:DisplayObject):DisplayObject
		{
			// TODO Auto Generated method stub
			return super.addChild(child);
		}
		
		
		public function t48():void
		{
			var mc = new GotoMC;
			mc.gotoAndStop(1)
			mc.gotoAndStop(2)
			
			FrameTween.play(mc, 1, function()
			{
				trace("aaaaa")
			})
		}
		
		public function t47():void
		{
			// CONFIG::debug
			// {
			// 	var xxxxxxx = new Object;
			// 	xxxxxxx.xxx = "hello"
			// 	trace(xxxxxxx.xxx);
			// }
			// {
			// 	var xxxxxxx = new Object;
			// 	trace(xxxxxxx.xxx);
			// }
		}
		
		public function t46():void
		{
			var arr = [1, 2, 3, 4]
			arr.splice(2, 1)
		}
		
		public function t45():void
		{
			var param = {}
			if (param.locked == null || param.locked)
			{
				trace("111")
			}
			var param = {}
			param.locked = true
			if (param.locked == null || param.locked)
			{
				trace("2111")
			}
		}
		
		public function t44():void
		{
			LoaderUtils.loadDomain("4011.swf", function(obj:*):void
			{
				var mc = DomainUtils.getInstance("com.aiyou.yesguo.fight.effect.Eff4011")
				addChild(mc)
				
				mc.x = mc.y = 600
				mc.rotation = MathUtils.angle(600, 600, 300, 300)
				mc.scaleY = -1
			})
		}
		
		public function t43():void
		{
			var arr:Array = []
			arr.length = -2;
		}
		
		public function t42():void
		{
			var len = 100;
			var pt1 = new Point(10,10);
			var pt2 = new Point(20,30);
			var pt = MathUtils.rayPt(pt1, pt2, pt2, len)
			var pt = MathUtils.rayPt(pt2, pt1, pt1, len)
		}
		
		public function t41():void
		{
			var n = 0
			for (var i=0;i<2*Math.PI;i+=0.1)
			{
				trace(Math.cos(i)*100,Math.sin(i)*100)
			}
		}
		
		public function t40():void
		{
			var clo = new Closure
			clo.func()
		}
		
		public function t39():void
		{
			LoaderUtils.loadDomain("version.swf", function(_)
			{
				var cls = DomainUtils.getClass("com.aiyou.yesguo.game.Version")
			})
		}
		
		public function t38():void
		{
			var arr = []
			for (var i:int = 0; i < 10; i++)
			{
				var o = {}
				o.aaa = i
				o.ff = function()
				{
					trace(o.aaa)
				}
				arr.push(o)
			}
			
			for each (var a in arr)
			{
				a.ff()
			}
		}
		
		public function t37():void
		{
			var o = {avatar:{monster:[600173]}}
			//			var s  = JSON.encode(o)
		}
		
		public function t36():void
		{
			var s = "{\"avatar\":{\"monster\":[600173]}}"
			//			var o = JSON.decode(s)
			
		}
		
		public function t35():void
		{
			var dic = new Dictionary;
			dic[123] = 222222
				delete dic[123];
		}
		
		public function t34():void
		{
			var t1 = TimeTicker.setTimeout(500, f1)
			function f1()
			{
				TimeTicker.clearTimeout(t1)
				TimeTicker.clearTimeout(tt2)
			}
			var tt2 = TimeTicker.setTimeout(1000, f2)
			function f2()
			{
				TimeTicker.clearTimeout(t1)
				TimeTicker.clearTimeout(tt2)
			}
		}
		
		public function t33():void
		{
			var t = null
			if (t is Function)
			{
				
			}
		}
		
		public function t32():void
		{
			var sp = new Sprite;
			addChild(sp)
			
			var sp2 = new Sprite;
			sp2.x = sp2.y = 100
			addChild(sp2)
			
			var sp3 = ShapeUtils.drawCircle(0xff0000, 1, 0,0,5)
			sp3.x = sp3.y = 200
			sp.addChild(sp3)
			
			var pt = sp.localToGlobal(new Point(sp3.x, sp3.y));
			var pt2 = sp2.globalToLocal(pt);
			
			sp3.x = pt2.x
			sp3.y = pt2.y
			sp2.addChild(sp3)
			
		}
		
		public function t31():void
		{
			LoaderUtils.loadDomain("attrEff.swf", function(_)
			{
				var bmp = DomainUtils.getInstance("com.aiyou.yesguo.fight.ui.attr.red.arrow")
				addChild(new Bitmap(bmp))
			})
		}
		
		public function t30():void
		{
			var t:Dictionary = function():Dictionary
			{
				return new Dictionary
			}()
			trace(t);
		}
		
		public function t29():void
		{
			LoaderUtils.loadDomain("20x52.swf", f1);
			LoaderUtils.loadDomain("20x52.swf", f2);
			
			function f1(xx:*):void
			{
				
			}
			function f2(xx:*):void
			{
				
			}
		}
		
		public function t28():void
		{
			var len:int = 3;
			var i:int = 0;
			for (var j:int = 0; j < 5; j++)
			{
				i = ++i % len;
			}
		}
		
		public function t27():void
		{
			TimeTicker.setTimeout(1000, t26)
		}
		
		public function t26():void
		{
			var pt = new Point(500, 1000);
			LinearTween.to(pt, 500, {x:100, y:200}, {onUpdate:update, onComplete:function()
			{
				trace(pt.toString())
			}})
			function update()
			{
				trace(pt.toString())
			}
		}
		
		public function t25():void
		{
			LoaderUtils.loadDomain("http://192.168.24.18/123guo/res/version.swf?v=1347943143078", function(_:*):void
			{
				var Version:Object = DomainUtils.getClass("com.aiyou.yesguo.game.Version");
			})
		}
		
		public function t24():void
		{
			var date:Date = new Date
			
			date.fullYear = 2013
			var cla:ChineseLunisolarCalendar = new ChineseLunisolarCalendar(date)
			var a = cla.getCnYear()
			var b = cla.getCnAnimalsSign()
			var c = cla.getCnMonth()
			var d = cla.getCnDay()
		}
		
		public function t23():void
		{
			var obj = {}
			obj.a ||= t22()
			obj.a ||= t22()
		}
		
		public function t22():int
		{
			trace("haha")
			return 100
		}
		
		public function t21():void
		{
			var obj = {};
			obj.delay /= 1000
		}
		
		public function t20():void
		{
			var i1:Int64 = new Int64(100, 100);
			var i2:Int64 = new Int64(200, 400);
			//			i1.add(300);
		}
		
		public function t19():void
		{
			var pt = MathUtils.ray(new Point, MathUtils.a2r(-8), 1200);
		}
		
		public function t18():void
		{
			XPerf.perf("sp")
			for (var i:int = 0;i < 100000; ++i)
			{
				var sp = new Sprite;
				addChild(sp);
				removeChild(sp);
			}
			XPerf.stop()
			XPerf.perf("sp2")
			for (var i:int = 0;i < 100000; ++i)
			{
				var sp2:Sprite = new Sprite;
				addChild(sp2);
				removeChild(sp2);
			}
			XPerf.stop()
		}
		
		public function t17():void
		{
			var arr = [];
			var a = arr[0];
		}
		
		public function t16():void
		{
			FrameTicker.setInterval(update);
			var i:int = 0;
			function update(d:Number):void
			{
				setTimeout(onTimeout,1);
				function onTimeout():void
				{
					trace(i++);
				}
			}
		}
		
		public function t15():void
		{
			LoaderUtils.loadDomain("data.swf",onComplete);
			function onComplete(_:Object):void
			{
				var cls = DomainUtils.getClass("com.aiyou.yesguo.data.SoldierText");
				var data = cls.data
			}
		}
		
		public function t14():void
		{
			var o  = {a:1,f:2}
			for (var k in o)
			{
				trace(k)
			}
		}
		
		public function t13():void
		{
			var url:String = "buff/yunxuan.swf";
			var name:String = url.split("/")[1].split(".")[0];
			var reg:RegExp = /buff\/(\w*)\.swf/;
			var arr = url.match(reg)[1]
		}
		
		public function t12():void
		{
			//			var p = WebUtils.getParam(stage, "test1");
			//			Debug.trace(p);
			//			p = WebUtils.getParam(stage, "test2");
			//			Debug.trace(p);
		}
		
		public function t11():void
		{
			LoaderUtils.loadDomain("2052.swf", onComplete);
			function onComplete(_:*):void
			{
				var a = DomainUtils.getInstance("com.aiyou.yesguo.fight.effect.Eff2052_02");
			}
		}
		
		private function t10():void
		{
			// TODO Auto Generated method stub
			Debug.trace(WebUtils.getParamInt(stage, "version"))
			
			var obj = {a:1,a:2,a:3,b:3,b:4,b:6};
		}
		
		public function t9():void
		{
			LoaderUtils.loadDomain("2053.swf", onComplete);
			function onComplete(_:*):void
			{
				for (var i:int = 0; i < 100; i++)
				{
					DomainUtils.getInstance("com.aiyou.yesguo.fight.effect.Eff2053_01");
				}
			}
		}
		
		public function t8():void
		{
			var o:Object = {};
			if(o.a)
			{
				
			}
			
			//			var o:* = JSON.decode(this["skillConfig"]);
		}
		
		public function t6(func:Function, num:Number = 1):void
		{
			t7();
			var bg:* = new Sprite;
			bg.addChild(ShapeUtils.drawRect(0xff0000, 1, 0, 0, 1200, 600));
			addChild(bg);
			
			var s:* = Easily;
			if (s.hasOwnProperty("a"))
			{
				
			}
			
			//			bg.transform.colorTransform = ColorUtil.getColorTransform(ColorContant.GRAY);
		}
		
		public static function t7(num:Number = 1):void
		{
			
		}
		
		public function t5():void
		{
			var bg:Sprite = new Sprite;
			bg.addChild(ShapeUtils.drawRect(0xffffff, 0, 0, 0, 1200, 600));
			addChild(bg);
			
			var blue:Sprite = new Sprite;
			blue.addChild(ShapeUtils.drawRect(0x0000ff, 0.5, 0, 0, 600, 300));
			bg.addChild(blue);
			blue.addEventListener(MouseEvent.CLICK, onClick);
			
			var red:MovieClip = new MovieClip;
			red.addChild(ShapeUtils.drawRect(0xff0000, 0.5, 0, 0, 300, 300));
			bg.addChild(red);
			red.mouseEnabled = false;
			red.filters = [new GlowFilter()];
		}
		
		private function onClick(event:MouseEvent):void
		{
			trace(event.localX, event.localY);
		}
		
		public function t4():void
		{
			LoaderUtils.loadDomain("test.swf",onComplete);
			function onComplete(...args):void
			{
				var test:MovieClip = DomainUtils.getInstance("com.test.ui.Test");
				test.haha();
				trace(test);
			}
		}
		
		public function t3():void
		{
			var arr:Array = [{},{},{}];
			for each (var o:Object in arr)
			{
				o.f = function():void
				{
					
				}
			}
			trace();
		}
		
		public function t2():void
		{
			LoaderUtils.loadRes("test.swf",function(mc:MovieClip):void
			{
				TweenMax.to(mc,1,{frame:mc.totalFrames,ease:Linear.easeNone,onUpdate:onUpdate});
				function onUpdate():void
				{
					trace(mc.currentFrame);
				}
			})
		}
		
		public function t1():void
		{
			var arr:Array = [1,2,3,4,5,6,7,8,9];
			for each (var num:int in ArrayUtils.clone(arr))
			{
				trace(num);
			}
		}
	}
}