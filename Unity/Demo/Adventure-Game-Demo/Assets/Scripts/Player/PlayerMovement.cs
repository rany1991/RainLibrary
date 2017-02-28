using UnityEngine;
using UnityEngine.EventSystems;


/*
 * 1. 用于控制主角Player的移动
 * 2. 用于控制主角Player和场景中可交互物品的互动
 * 
 * 用于Market和SecurityRoom场景中
 * 
 */
public class PlayerMovement : MonoBehaviour
{
	//指向Player的Animator组件
    public Animator animator;

	//指向Player的NavMeshAgent组件
    public UnityEngine.AI.NavMeshAgent agent;

	//保存Player的初始化数据
    public PersistentDataObject persistentLocationDataObject;

	//保存Player目前正在交互的可交互物品
    private Interactable currentInteractable;

	//保存Player的Animator组件中用到的两个tag
    private readonly int hashSpeedPara = Animator.StringToHash ("Speed");
    private readonly int hashLocomotionTag = Animator.StringToHash ("Locomotion");

	//让Player移动起来的临界值
    private const float walkingSpeedThreshold = 0.1f;


    private void Start ()
    {
		//设置和初始化Player
        agent.updateRotation = false;

        transform.position = persistentLocationDataObject.position;
        transform.rotation = persistentLocationDataObject.rotation;
    }


	//每一帧都判断是否移动Player, 以及Player是否接近了可交互物体
    private void Update ()
    {
        AnimatePlayer ();

        ApproachingInteractable ();
    }


	//按照Player当前的移动速度来让Player做相应的移动动作
    private void AnimatePlayer ()
    {
		//获取Player的当前移动速度
        float speed = agent.velocity.magnitude;

		//将移动速度赋值给Animator的speed参数
        animator.SetFloat (hashSpeedPara, speed);

		//如果当前移动速度超过了所设定的临界值,那么让Player移动起来
        if (speed > walkingSpeedThreshold)
        {
            Vector3 flatVelocity = new Vector3(agent.velocity.x, 0f, agent.velocity.z);
            transform.LookAt(transform.position + flatVelocity);
        }
    }

	//用于判断是否Player靠近可交互物体,如果靠近则让可交互物体做出反馈
    private void ApproachingInteractable ()
    {
		//如果在Update循环里面检测到currentInteractable不为空
        if (currentInteractable != null)
        {
			//获取当前Player和可交互物体的距离
			float distanceToInteractable = Vector3.Distance (transform.position, agent.destination);

			//如果当前Player和可交互物体的距离接近于0
            if (Mathf.Approximately (distanceToInteractable, 0f))
            {
				//让Player朝向可交互物体 (这就是为什么InteractionLocation物体要设置一个Rotation值的原因)
                transform.rotation = currentInteractable.interactionLocation.rotation;

				//与可交互物体进行交互
                currentInteractable.Interact ();

				//将当前可交互物体设为空
                currentInteractable = null;
            }
        }
    }


	//如果Player可以移动, 当点击地面时, 让Player移动到所点击的位置
    public void OnGroundClick (BaseEventData data)
    {
        if (CharacterCanMove ())
        {
			//设置当前可交互物体为空,因为Player只是在无目的的移动
            currentInteractable = null;

            PointerEventData pData = (PointerEventData)data;

			//让Player移动到目标位置
            agent.SetDestination (pData.pointerCurrentRaycast.worldPosition);
        }
    }

	//如果Player可以移动, 当点击可交互物体时, 让Player移动到可交互物体的位置
    public void OnInteractableClick (Interactable interactable)
    {
        if (CharacterCanMove ())
        {
			//将目标可交互物体设置为当前Player正在交互的物体
            currentInteractable = interactable;

			//让Player移动到目标位置
            agent.SetDestination (currentInteractable.interactionLocation.position);
        }
    }


	//判断Player当前是否可以移动
    private bool CharacterCanMove ()
    {
		bool currentStateIsLocomotion = (animator.GetCurrentAnimatorStateInfo (0).tagHash == hashLocomotionTag);

        bool canMove;

		//如果正在做动画状态之间的过渡, 则返回false当前Player不允许移动
        if (animator.IsInTransition (0))
        {
			canMove = currentStateIsLocomotion && (animator.GetNextAnimatorStateInfo(0).tagHash == hashLocomotionTag);
        }
        else
        {
            canMove = currentStateIsLocomotion;
        }

        return canMove;
    }
}
