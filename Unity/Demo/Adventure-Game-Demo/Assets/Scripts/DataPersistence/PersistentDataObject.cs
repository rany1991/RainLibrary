using UnityEngine;

/*
 * 有两个用途：
 * 
 * 1. 用于从Create菜单生成ScriptableObject来保存道具的数据，比如Coin，CoffeeBot，Glasses等
 * 2. 用于从PersistentDataResetter脚本中，把指定的数据设置成默认值
 * 
 */

[CreateAssetMenu]
public class PersistentDataObject : ScriptableObject
{
    public bool defaultActivityState;
    public bool defaultEnabledState;
    public bool defaultInteractableUsedState;
    public Vector3 defaultPosition;
    public Vector3 defaultRotation;

	//[HideInInspector]可以让public的变量不会显示在Inspector上，方便管理
    [HideInInspector] public bool activityState;
    [HideInInspector] public bool enabledState;
    [HideInInspector] public bool interactableUsedState;
    [HideInInspector] public Vector3 position;
    [HideInInspector] public Quaternion rotation;


	//把指定的ScriptableObject的值设置为默认值
    public void ResetToDefaults ()
    {
        activityState = defaultActivityState;
        enabledState = defaultEnabledState;
        interactableUsedState = defaultInteractableUsedState;
        position = defaultPosition;
        rotation = Quaternion.Euler (defaultRotation);
    }
}
