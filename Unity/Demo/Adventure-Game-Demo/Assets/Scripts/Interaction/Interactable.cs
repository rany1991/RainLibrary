using UnityEngine;

public class Interactable : MonoBehaviour
{
	//指向每个可交互物体的InteractionLocation物体
    public Transform interactionLocation;

	//标记次物体是否已交互过 (比如在CoinInteractable上有用到, 这样就不会一直可以拿到金币了)
    public bool isUsed;

	//用于配置触发反馈的条件
    public Condition[] conditions;

	//指向默认反馈
    public Reaction defaultReaction;


    private Inventory inventory;


    private void Start ()
    {
		//在场景中找到Inventory
        inventory = FindObjectOfType<Inventory> ();
    }


    public void Interact ()
    {
        bool hasReactedToCondition = false;

		//遍历所有的可以触发反馈的条件
        for (int i = 0; i < conditions.Length; i++)
        {
            if (conditions[i].Check (inventory))
            {
                conditions[i].React ();
                hasReactedToCondition = true;
                break;
            }
        }

		//如果没有设置过条件, 而且我们又设置了默认的反馈, 那么就使用默认的反馈
        if (!hasReactedToCondition && defaultReaction)
        {
            defaultReaction.React ();
        }
    }
}
