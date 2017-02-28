using UnityEngine;

/*
 * 用于控制场景摄像机 
 * 
 * 用于Market和SecurityRoom两个场景中
 * 
 */
public class CameraControl : MonoBehaviour
{
    public bool moveCamera = true;                        // 用于控制摄像机是否会旋转然后对准主角Player
    public Vector3 offset = new Vector3 (0f, 1.5f, 0f);   // 摄像机看的地方相对于Player的位移
    public Transform playerPosition;                      // 获取Player在场景中的当前位置


    private void Update ()
    {
        // 如果我们允许摄像机旋转，那么摄像机就对准Player进行跟踪移动
        if (moveCamera)
            transform.LookAt (playerPosition.position + offset);
    }
}