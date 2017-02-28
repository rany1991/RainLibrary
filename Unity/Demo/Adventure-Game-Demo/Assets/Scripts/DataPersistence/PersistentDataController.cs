using UnityEngine;

/*
 * 1. 用于控制指定的ScriptableObject
 * 2. 加载/保存指定的ScriptableObject
 * 
 * 用于Market场景中
 * 
 */
public class PersistentDataController : MonoBehaviour
{
	//配置指定的ScriptableObject
    public PersistentDataObject persistentDataObject;
    public GameObject persistentActivityGameObject;
    public Behaviour persistentEnabledBehaviour;
    public Interactable persistentUsedInteractable;
    public Transform persistentPositionTransform;
    public Transform persistentRotationTransform;


	//应用于SceneController中，加载指定的ScriptableObject
    public void Load ()
    {
        if (persistentActivityGameObject)
        {
            persistentActivityGameObject.SetActive (persistentDataObject.activityState);
        }

        if (persistentEnabledBehaviour)
        {
            persistentEnabledBehaviour.enabled = persistentDataObject.enabledState;
        }

        if (persistentUsedInteractable)
        {
            persistentUsedInteractable.isUsed = persistentDataObject.interactableUsedState;
        }

        if (persistentPositionTransform)
        {
            persistentPositionTransform.position = persistentDataObject.position;
        }

        if (persistentRotationTransform)
        {
            persistentRotationTransform.rotation = persistentDataObject.rotation;
        }
    }


	//应用于SceneController中，保存指定的ScriptableObject数据
    public void Save ()
    {
        if (persistentActivityGameObject)
        {
            persistentDataObject.activityState = persistentActivityGameObject.activeSelf;
        }

        if (persistentEnabledBehaviour)
        {
            persistentDataObject.enabledState = persistentEnabledBehaviour.enabled;
        }

        if (persistentUsedInteractable)
        {
            persistentDataObject.interactableUsedState = persistentUsedInteractable.isUsed;
        }

        if (persistentPositionTransform)
        {
            persistentDataObject.position = persistentPositionTransform.position;
        }

        if (persistentRotationTransform)
        {
            persistentDataObject.rotation = persistentRotationTransform.rotation;
        }
    }
}
