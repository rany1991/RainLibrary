using UnityEngine;

//用于Persistent场景中
//把指定的ScriptableObject的值设置为默认值
public class PersistentDataResetter : MonoBehaviour
{
    //在Inspector窗口中指定想要重置回默认值的ScriptableObject
	public PersistentDataObject[] persistentDataObjects;


	//在场景加载时把指定的ScriptableObject设定为默认值
    private void Start ()
    {
        for (int i = 0; i < persistentDataObjects.Length; i++)
        {
            persistentDataObjects[i].ResetToDefaults ();
        }
    }
}
