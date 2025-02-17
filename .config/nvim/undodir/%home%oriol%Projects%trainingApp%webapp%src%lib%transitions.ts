Vim�UnDo� �'�ƷMm-piMa�)s�jݔE;!�v����      c	{ delay = 0, duration = 150, easing = cubicOut, start = 0.5, x = 0, y = '-100', opacity = 0 } = {}      I                       g	    _�                            ����                                                                                                                                                                                                                                                                                                                                       {           V        g	;     �              {   <script lang="ts">   1	import { compressImage } from '$lib/imageTools';   )	import type { Image } from '$lib/types';        	let isDragging = $state(false);   (	let input = $state<HTMLInputElement>();       	type Props = {   		images: Image[];   	};       0	let { images = $bindable() }: Props = $props();       (	function handleDragOver(event: Event) {   		event.preventDefault();   		isDragging = true;   	}       )	function handleDragLeave(event: Event) {   		event.preventDefault();   		isDragging = false;   	}       -	function handleFileSelection(event: Event) {   		event.preventDefault();   5		const fileInput = event.target as HTMLInputElement;   		if (fileInput.files) {   			loadImages(fileInput.files);   		}   	}       2	async function loadImages(imageFiles: FileList) {   /		for (const image of Array.from(imageFiles)) {   			let newImage: Image = {   				id: crypto.randomUUID(),   				file: null as any,   				status: 'pending'   			};       "			images = [...images, newImage];   6			const compressedImage = await compressImage(image);   			if (compressedImage) {   '				// newImage.file = compressedImage;   %				// newImage.status = 'completed';       3				//TODO look for a better svelte5 way to do this    				images = images.map((img) =>   Z					img.id === newImage.id ? { ...img, file: compressedImage, status: 'completed' } : img   				);   			}   		}   	}       (	function handleDrop(event: DragEvent) {   		event.preventDefault();   		isDragging = false;   #		if (event.dataTransfer == null) {   
			return;   		}   '		loadImages(event.dataTransfer.files);   	}       /	function handleKeyDown(event: KeyboardEvent) {   3		if (event.key === 'Enter' || event.key === ' ') {   			event.preventDefault();   			input?.click();   		}   	}       0	function removeImage(imageToRemoveID: string) {   T		images = Array.from(images).filter((image: Image) => image.id != imageToRemoveID);   	}   	</script>       ,<div class="h-full flex flex-col space-y-2">   	{#if images?.length}    		{#each images as image, index}   L			<div class="flex-1 min-h-0 relative bg-green-200 w-full overflow-hidden">   #				{#if image.status == 'pending'}   M					<p class="absolute inset-0 flex items-center justify-center">Loading</p>       J					<span class="loading loading-spinner loading-md text-primary"></span>   					{/if}   %				{#if image.status == 'completed'}   #					<div class="absolute inset-0">   
						<img   ,							src={URL.createObjectURL(image.file)}   !							alt="exercise {index + 1}"   9							class="h-full w-full object-cover overflow-hidden"   						/>   						<button    							aria-label="remove image"   F							class="btn btn-circle bg-red-500 btn-sm absolute top-2 right-2"   ,							onclick={() => removeImage(image.id)}   						>   
							✕   						</button>   					</div>   					{/if}   				</div>   			{/each}   	{/if}   	{#if images.length < 3}   		<div   			role="button"   			tabindex={0}   			aria-label="File drop zone"   �			class="flex-1 min-h-0 border-2 cursor-pointer border-dashed border-sky-500 text-center rounded-lg w-full transition-colors duration-300 ease-in-out"   "			class:bg-green-200={isDragging}   			ondragover={handleDragOver}    			ondragleave={handleDragLeave}   			ondrop={handleDrop}   			onclick={() => {   				input?.click();   			}}   			onkeypress={handleKeyDown}   		>   a			<input type="file" bind:this={input} hidden onchange={handleFileSelection} accept="image/*" />       3			<p>Drag & drop files here or click to upload</p>   		</div>   	{/if}   </div>5��            {                      �             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        g	E     �                   �               5��                                         6      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        g	F    �                  5��                                                  5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        g	i    �   
            export function flyandScale(5��    
                    d                    5�_�                       I    ����                                                                                                                                                                                                                                                                                                                                                  V        g	     �               c	{ delay = 0, duration = 150, easing = cubicOut, start = 0.5, x = 0, y = '-100', opacity = 0 } = {}5��       I                  �                     5�_�                        M    ����                                                                                                                                                                                                                                                                                                                                                  V        g	    �               b	{ delay = 0, duration = 150, easing = cubicOut, start = 0.5, x = 0, y = -100', opacity = 0 } = {}5��       M                  �                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        g	<     �              �              |       <script lang="ts">   1	import { compressImage } from '$lib/imageTools';   )	import type { Image } from '$lib/types';        	let isDragging = $state(false);   (	let input = $state<HTMLInputElement>();       	type Props = {   		images: Image[];   	};       0	let { images = $bindable() }: Props = $props();       (	function handleDragOver(event: Event) {   		event.preventDefault();   		isDragging = true;   	}       )	function handleDragLeave(event: Event) {   		event.preventDefault();   		isDragging = false;   	}       -	function handleFileSelection(event: Event) {   		event.preventDefault();   5		const fileInput = event.target as HTMLInputElement;   		if (fileInput.files) {   			loadImages(fileInput.files);   		}   	}       2	async function loadImages(imageFiles: FileList) {   /		for (const image of Array.from(imageFiles)) {   			let newImage: Image = {   				id: crypto.randomUUID(),   				file: null as any,   				status: 'pending'   			};       "			images = [...images, newImage];   6			const compressedImage = await compressImage(image);   			if (compressedImage) {   '				// newImage.file = compressedImage;   %				// newImage.status = 'completed';       3				//TODO look for a better svelte5 way to do this    				images = images.map((img) =>   Z					img.id === newImage.id ? { ...img, file: compressedImage, status: 'completed' } : img   				);   			}   		}   	}       (	function handleDrop(event: DragEvent) {   		event.preventDefault();   		isDragging = false;   #		if (event.dataTransfer == null) {   
			return;   		}   '		loadImages(event.dataTransfer.files);   	}       /	function handleKeyDown(event: KeyboardEvent) {   3		if (event.key === 'Enter' || event.key === ' ') {   			event.preventDefault();   			input?.click();   		}   	}       0	function removeImage(imageToRemoveID: string) {   T		images = Array.from(images).filter((image: Image) => image.id != imageToRemoveID);   	}   	</script>       ,<div class="h-full flex flex-col space-y-2">   	{#if images?.length}    		{#each images as image, index}   L			<div class="flex-1 min-h-0 relative bg-green-200 w-full overflow-hidden">   #				{#if image.status == 'pending'}   M					<p class="absolute inset-0 flex items-center justify-center">Loading</p>       J					<span class="loading loading-spinner loading-md text-primary"></span>   					{/if}   %				{#if image.status == 'completed'}   #					<div class="absolute inset-0">   
						<img   ,							src={URL.createObjectURL(image.file)}   !							alt="exercise {index + 1}"   9							class="h-full w-full object-cover overflow-hidden"   						/>   						<button    							aria-label="remove image"   F							class="btn btn-circle bg-red-500 btn-sm absolute top-2 right-2"   ,							onclick={() => removeImage(image.id)}   						>   
							✕   						</button>   					</div>   					{/if}   				</div>   			{/each}   	{/if}   	{#if images.length < 3}   		<div   			role="button"   			tabindex={0}   			aria-label="File drop zone"   �			class="flex-1 min-h-0 border-2 cursor-pointer border-dashed border-sky-500 text-center rounded-lg w-full transition-colors duration-300 ease-in-out"   "			class:bg-green-200={isDragging}   			ondragover={handleDragOver}    			ondragleave={handleDragLeave}   			ondrop={handleDrop}   			onclick={() => {   				input?.click();   			}}   			onkeypress={handleKeyDown}   		>   a			<input type="file" bind:this={input} hidden onchange={handleFileSelection} accept="image/*" />       3			<p>Drag & drop files here or click to upload</p>   		</div>   	{/if}   </div>5��                   {                      �      5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             g	    �              5��                                 2               5��