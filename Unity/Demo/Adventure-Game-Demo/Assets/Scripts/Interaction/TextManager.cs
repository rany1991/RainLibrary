using UnityEngine;
using System.Collections.Generic;
using System.Linq;
using UnityEngine.UI;

/*
 * 用于Market和SecurityRoom场景
 * 
 * 用于管理对话文字的显示
 * 
 */ 

public class TextManager : MonoBehaviour
{
    // 子类用于保存每一条文字显示的指令
    public class Instruction
    {
        public string message;    // 显示的文字
        public Color textColor;   // 文字的颜色
        public float startTime;   // 文字显示的开始时间
    }


    public Text text;                             // 指向用于显示文字的UIText组件
    public float displayTimePerCharacter = 0.1f;  // 每个字母显示所需要的时长
    public float additionalDisplayTime = 0.5f;    // 显示所有文字所需时长以外还需要的显示时间


    private List<Instruction> instructions = new List<Instruction> ();    // 按照先后次序排列的文字显示指令
    private float clearTime;                                              // 清除UIText组件上文字的时长


    private void Update ()
    {
        // 如果目前有文字显示的指令, 而且这个指令的显示时间也已经到了
        if (instructions.Count > 0 && Time.time >= instructions[0].startTime)
        {
            // 显示文字, 并把这条使用过的指令从列表中删除
            text.text = instructions[0].message;
            text.color = instructions[0].textColor;
            instructions.RemoveAt (0);
        }
        else if (Time.time >= clearTime)
        {
            // 如果已经到了清除文字的时间, 就把UI上的文字删除
            text.text = string.Empty;
        }
    }


	//在Reaction.cs里面的TextReaction里面调用, 用于显示文字到UI上
    public void DisplayMessage (string message, Color textColor, float delay)
    {
        float startTime = Time.time + delay;
        float displayDuration = message.Length * displayTimePerCharacter + additionalDisplayTime;
        float newClearTime = startTime + displayDuration;

        // clearTime只会在大于当前的clearTime的情况下被更新
        if (newClearTime > clearTime)
            clearTime = newClearTime;

        // 创建一条新的文字显示指令
        Instruction newInstruction = new Instruction
        {
            message = message,
            textColor = textColor,
            startTime = Time.time + delay
        };

        // 把文字显示指令添加到列表中
        instructions.Add (newInstruction);

        // 按照每条指令的开始时间来做个排序
        instructions = instructions.OrderBy (x => x.startTime).ToList ();
    }
}
